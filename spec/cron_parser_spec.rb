# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CronParser do
  let(:parser) { CronParser.new }

  describe '#parse' do
    it 'parses a valid cron string' do
      cron_string = '*/15 0 1,15 * 1-5 /usr/bin/find'
      expected_result = {
        'minute' => (0..59).step(15).to_a,
        'hour' => [0],
        'day of month' => [1, 15],
        'month' => (1..12).to_a,
        'day of week' => (1..5).to_a,
        'command' => '/usr/bin/find'
      }
      expect(parser.parse(cron_string)).to eq(expected_result)
    end

    it 'parses a valid cron string with month range' do
      cron_string = '*/15 0 1,15-17 * 1-5 /usr/bin/find'
      expected_result = {
        'minute' => (0..59).step(15).to_a,
        'hour' => [0],
        'day of month' => [1, 15, 16, 17],
        'month' => (1..12).to_a,
        'day of week' => (1..5).to_a,
        'command' => '/usr/bin/find'
      }
      expect(parser.parse(cron_string)).to eq(expected_result)
    end

    it 'raises an error for an invalid cron string' do
      expect { parser.parse('invalid cron string') }.to raise_error(ArgumentError)
      expect { parser.parse('* * * * 8 /command') }.to raise_error(ArgumentError)
    end
  end
end
