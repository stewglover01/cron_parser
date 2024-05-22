# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ParserValidator do
  let(:validator) { ParserValidator.new }

  describe '#validate' do
    it 'validates a valid cron field' do
      expect { validator.validate('*', 0, 59) }.not_to raise_error
    end

    it 'raises an error for an out-of-range value' do
      expect { validator.validate('70', 0, 59) }.to raise_error(ArgumentError)
    end
  end
end
