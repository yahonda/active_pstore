# -*- frozen-string-literal: true -*-

#
# Original code is ActiveRecord::DynamicMatcher, thx.
#
# https://github.com/rails/rails/blob/4-2-stable/activerecord/lib/active_record/dynamic_matchers.rb
#
module ActivePStore
  module DynamicMatchers
    def respond_to?(name, include_private = false)
      if self == Base
        super
      else
        match = Method.match(self, name)
        match || super
      end
    end

    private

    def method_missing(name, *arguments, &block)
      match = Method.match(self, name)

      if match
        match.define
        public_send(name, *arguments, &block)
      else
        super
      end
    end

    class Method
      @matchers = []

      class << self
        attr_reader :matchers

        def match(model, name)
          klass = matchers.find {|k| k.pattern === name }
          klass.new(model, name) if klass
        end

        def pattern
          @pattern ||= /\A#{prefix}_([_a-zA-Z]\w*)#{suffix}\Z/
        end

        def prefix
          raise NotImplementedError
        end

        def suffix
          ''
        end
      end

      attr_reader :model, :name, :attribute_names

      def initialize(model, name)
        @model           = model
        @name            = name.to_s
        @attribute_names = @name.match(self.class.pattern)[1].split('_and_')
      end

      def define
        model.class_eval <<-CODE, __FILE__, __LINE__ + 1
          def self.#{name}(#{signature})
            #{body}
          end
        CODE
      end

      private

      def body
        "#{finder}(#{attributes_hash})"
      end

      # The parameters in the signature may have reserved Ruby words, in order
      # to prevent errors, we start each param name with `_`.
      def signature
        attribute_names.map {|name| "_#{name}" }.join(', ')
      end

      # Given that the parameters starts with `_`, the finder needs to use the
      # same parameter name.
      def attributes_hash
        "{" + attribute_names.map {|name| ":#{name} => _#{name}" }.join(',') + "}"
      end

      def finder
        raise NotImplementedError
      end
    end

    class FindBy < Method
      Method.matchers << self

      def self.prefix
        'find_by'
      end

      def finder
        'find_by'
      end
    end

    class FindByBang < Method
      Method.matchers << self

      def self.prefix
        'find_by'
      end

      def self.suffix
        '!'
      end

      def finder
        'find_by!'
      end
    end
  end
end
