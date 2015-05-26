require 'pstore'
require 'securerandom'

module ActivePStore
  class Base
    CONFIG_PATH = '/tmp/foo'

    @@db = PStore.new(CONFIG_PATH)

    attr_reader :id

    class << self
      def all
        @@db.transaction do
          @@db[self.key]
        end
      end

      def first
        @@db.transaction do
          @@db[self.key].first
        end
      end

      def last
        @@db.transaction do
          @@db[self.key].last
        end
      end

      def where(conditions = {})
        ret = self.all

        return ret if conditions.empty?

        @@db.transaction do
          conditions.each {|key, value|
            ret = ret.select {|obj|
              if value.is_a? Range
                value.include?(obj.__send__(key))
              else
                obj.__send__(key) == value
              end
            }
          }
        end

        ret
      end

      def destroy_all
        @@db.transaction do
          @@db[self.key] = []
        end
      end

      def count
        @@db.transaction do
          @@db[self.key].count
        end
      end

      def key
        self.class.to_s
      end
    end

    def save
      @id ||= SecureRandom.hex

      @@db.transaction do
        if @@db[self.class.key]
          @@db[self.class.key] << self
        else
          @@db[self.class.key] = [self]
        end
      end
    end
  end
end
