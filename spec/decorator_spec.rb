require_relative '../nameable'
require_relative '../base_decorator'
require_relative '../capitalize_decorator'
require_relative '../trimmer_decorator'

describe BaseDecorator do
  let(:nameable_object) { double('nameable_object', correct_name: 'john doe') }
  subject(:decorator) { described_class.new(nameable_object) }

  describe '#correct_name' do
    it 'calls the correct_name method on the wrapped object' do
      expect(nameable_object).to receive(:correct_name)
      decorator.correct_name
    end
  end
end

describe CapitalizeDecorator do
  let(:nameable_object) { double('nameable_object', correct_name: 'john doe') }
  subject(:decorator) { described_class.new(nameable_object) }

  describe '#correct_name' do
    it 'capitalizes each word in the wrapped object\'s correct_name' do
      expect(decorator.correct_name).to eq('JOHN DOE')
    end
  end
end

describe TrimmerDecorator do
  let(:nameable_object) { double('nameable_object', correct_name: 'john doe') }
  subject(:decorator) { described_class.new(nameable_object) }

  describe '#correct_name' do
    it 'trims the wrapped object\'s correct_name to 10 characters' do
      expect(decorator.correct_name).to eq('john doe')
    end
  end
end
