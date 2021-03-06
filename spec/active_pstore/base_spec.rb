# -*- frozen-string-literal: true -*-

describe ActivePStore::Base do
  include_context 'Rock stars on stage'

  let(:attributes) {
    {
      name: 'Edward Van Halen',
      associated_act: 'Van Halen',
      instrument: 'guitar',
      birth_date: Date.new(1955, 1, 26)
    }
  }

  let(:block) {
    ->(a) {
      a.name = 'Edward Van Halen'
      a.associated_act = 'Van Halen'
      a.instrument = 'guitar'
      a.birth_date = Date.new(1955, 1, 26)
    }
  }

  shared_examples_for 'instantiate ActivePStore model' do
    it { expect(subject.name).to eq 'Edward Van Halen' }
    it { expect(subject.associated_act).to eq 'Van Halen' }
    it { expect(subject.instrument).to eq 'guitar' }
    it { expect(subject.birth_date).to eq Date.new(1955, 1, 26) }
  end

  describe '.new' do
    context 'with attributes' do
      subject { Artist.new(attributes) }

      it_behaves_like 'instantiate ActivePStore model'

      it { is_expected.to be_new_record }
    end

    context 'nil' do
      subject { Artist.new(nil) }

      it { is_expected.to be_new_record }
    end

    context 'with block' do
      subject { Artist.new(&block) }

      it_behaves_like 'instantiate ActivePStore model'

      it { is_expected.to be_new_record }
    end

    context 'no method error' do
      subject { Artist.new(undefined_method: 'value') }

      it { expect { subject }.to raise_error(StandardError, "undefined method `undefined_method='") }
    end
  end

  describe '.build' do
    context 'with attributes' do
      subject { Artist.build(attributes) }

      it_behaves_like 'instantiate ActivePStore model'

      it { is_expected.to be_new_record }
    end

    context 'with block' do
      subject { Artist.build(&block) }

      it_behaves_like 'instantiate ActivePStore model'

      it { is_expected.to be_new_record }
    end
  end

  describe '.create' do
    context 'with attributes' do
      context 'attributes for single object' do
        subject { Artist.create(attributes) }

        it_behaves_like 'instantiate ActivePStore model'

        it { is_expected.not_to be_new_record }

        it { is_expected.to eq(Artist.find(subject)) }
      end

      context 'attributes for multiple object' do
        subject { Artist.create([{name: 'Ritchie Blackmore'}, {name: 'Jimi Hendrix'}]) }

        it { expect(subject.count).to eq 2 }

        it { expect(subject[0].name).to eq 'Ritchie Blackmore' }
        it { expect(subject[0]).not_to be_new_record }
        it { expect(subject[1].name).to eq 'Jimi Hendrix' }
        it { expect(subject[1]).not_to be_new_record }
      end
    end

    context 'with block' do
      subject { Artist.create(&block) }

      it_behaves_like 'instantiate ActivePStore model'

      it { is_expected.not_to be_new_record }

      it { is_expected.to eq(Artist.find(subject)) }
    end
  end

  shared_examples_for 'find_or_create series' do
    context 'exist artist' do
      let(:instrument) { 'guitar' }

      it { is_expected.to eq randy_rhoads }
    end

    context 'not exist artist' do
      before { Artist.destroy_all }

      let(:instrument) { 'drums' }

      it { expect(subject.id).to eq subject.id }
      it { expect(subject.name).to be_nil }
      it { expect(subject.associated_act).to be_nil }
      it { expect(subject.instrument).to eq instrument }
      it { expect(subject.birth_date).to be_nil }
    end
  end

  describe '.first_or_create' do
    subject { Artist.first_or_create(instrument: instrument) }

    it_behaves_like 'find_or_create series'
  end

  describe '.find_or_create_by' do
    subject { Artist.find_or_create_by(instrument: instrument) }

    it_behaves_like 'find_or_create series'
  end

  describe '.find_or_initialize_by' do
    let(:instrument) { 'drums' }

    subject { Artist.find_or_initialize_by(instrument: instrument) }

    it_behaves_like 'find_or_create series'

    it { is_expected.to be_new_record }
  end

  describe '#valid?' do
    let(:artist) { Artist.new(name: name) }

    subject { artist.valid? }

    context 'valid' do
      let(:name) { 'foo' }

      it { is_expected.to be true }
    end

    context 'invalid' do
      let(:name) { '' }

      it { is_expected.to be false }
    end
  end
end
