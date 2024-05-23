#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/cron_parser'

def main
  if ARGV.length != 1
    puts "Usage: bin/parser_main '<cron_string>'"
    exit 1
  end

  cron_string = ARGV[0]
  parser = CronParser.new

  begin
    parsed_cron = parser.parse(cron_string)
  rescue ArgumentError => e
    puts "Error: #{e.message}"
    exit 1
  end

  puts render_output(parsed_cron)
end

def render_output(parsed_cron)
  output = []
  output << "minute        #{parsed_cron['minute'].join(' ')}"
  output << "hour          #{parsed_cron['hour'].join(' ')}"
  output << "day of month  #{parsed_cron['day of month'].join(' ')}"
  output << "month         #{parsed_cron['month'].join(' ')}"
  output << "day of week   #{parsed_cron['day of week'].join(' ')}"
  output << "command       #{parsed_cron['command']}"
  output.join("\n")
end

main if __FILE__ == $PROGRAM_NAME
