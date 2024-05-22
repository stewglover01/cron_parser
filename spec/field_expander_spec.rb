# frozen_string_literal: true

require 'spec_helper'

RSpec.describe FieldExpander do
  let(:expander) { FieldExpander.new }

  describe '#expand' do
    it 'expands wildcard' do
      expect(expander.expand('*', 0, 59)).to eq((0..59).to_a)
    end

    it 'expands step values' do
      expect(expander.expand('*/15', 0, 59)).to eq((0..59).step(15).to_a)
    end

    it 'expands ranges' do
      expect(expander.expand('1-5', 0, 59)).to eq((1..5).to_a)
    end

    it 'expands lists' do
      expect(expander.expand('1,15,30', 0, 59)).to eq([1, 15, 30])
    end

    it 'expands mixed lists and ranges' do
      expect(expander.expand('1,5-7', 0, 59)).to eq([1, 5, 6, 7])
    end
  end
end
