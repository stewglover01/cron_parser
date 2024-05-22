# frozen_string_literal: true

class ParserValidator
  def validate(field, min_val, max_val)
    values = FieldExpander.new.expand(field, min_val, max_val)
    values.each do |value|
      raise ArgumentError, "Value #{value} out of range (#{min_val}-#{max_val})" if value < min_val || value > max_val
    end
  end
end
