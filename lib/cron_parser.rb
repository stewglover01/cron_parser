# frozen_string_literal: true

require_relative 'field_expander'
require_relative 'parser_validator'

class CronParser
  def initialize(field_expander: FieldExpander.new, validator: ParserValidator.new)
    @field_expander = field_expander
    @validator = validator
  end

  def parse(cron_string)
    fields = cron_string.split
    raise ArgumentError, 'Cron string must have minimum of 5 time fields and a command' if fields.size < 6

    minute_field = fields[0]
    hour_field = fields[1]
    day_of_month_field = fields[2]
    month_field = fields[3]
    day_of_week_field = fields[4]
    command = fields[5..].join(' ')

    @validator.validate(minute_field, 0, 59)
    @validator.validate(hour_field, 0, 23)
    @validator.validate(day_of_month_field, 1, 31)
    @validator.validate(month_field, 1, 12)
    @validator.validate(day_of_week_field, 1, 7)

    {
      'minute' => @field_expander.expand(minute_field, 0, 59),
      'hour' => @field_expander.expand(hour_field, 0, 23),
      'day of month' => @field_expander.expand(day_of_month_field, 1, 31),
      'month' => @field_expander.expand(month_field, 1, 12),
      'day of week' => @field_expander.expand(day_of_week_field, 1, 7),
      'command' => command
    }
  end
end
