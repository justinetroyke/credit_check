require 'pry'
class CreditCheck

  attr_reader :card_number

  def initialize(card_number)
    @card_number = card_number
  end

  def convert_to_array
    reversed_array = @card_number.to_i.digits
  end

  def double
    doubled = convert_to_array.map.with_index do |number, index|
    number * 2 if index.odd?
    end
    doubled.compact
  end

  def even_digits
    even = convert_to_array.map.with_index do |number, index|
      if index.even?
        number
      end
    end
    even.compact
  end

  def sum_over_10
    summed_over_10 = double.map do |number|
      if number > 9
        number - 9
      else
        number
      end
    end
  end

  def total_sum
   (sum_over_10 + even_digits).sum
  end
end

# def checker
  # multiply every other
  # add digits over 10 togerther
  # sum results
# end
