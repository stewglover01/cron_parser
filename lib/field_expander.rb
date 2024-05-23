# frozen_string_literal: true

class FieldExpander
  def expand(field, min_val, max_val)
    return (min_val..max_val).to_a if field == '*'
    return (min_val..max_val).step(field[2..].to_i).to_a if field.start_with?('*/')
    return list_range(field) if field.include?('-') && field.include?(',')
    return range(field) if field.include?('-')
    return date_list(field) if field.include?(',')

    [field.to_i]
  end

  private

  def list_range(field)
    parts = field.split(',')
    result = []
    parts.each do |part|
      if part.include?('-')
        start_val, end_val = part.split('-').map(&:to_i)
        result.concat((start_val..end_val).to_a)
      else
        result << part.to_i
      end
    end
    result
  end

  def range(field)
    start_val, end_val = field.split('-').map(&:to_i)
    (start_val..end_val).to_a
  end

  def date_list(field)
    field.split(',').map(&:to_i)
  end
end
