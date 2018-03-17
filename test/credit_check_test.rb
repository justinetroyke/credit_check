require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/credit_check'
require 'pry'

class CreditCheckTest < Minitest::Test

  def test_it_exists
    check = CreditCheck.new("5541808923795240")

    assert_instance_of CreditCheck, check
  end

  def test_it_can_accept_number
    check = CreditCheck.new("5541808923795240")

    assert_equal "5541808923795240", check.card_number
  end

  def test_card_number_is_a_reversed_array
   check = CreditCheck.new("5541808923795240")

    assert_equal [0,4,2,5,9,7,3,2,9,8,0,8,1,4,5,5], check.convert_to_array
  end

  def test_every_other_digit_times_2
    check = CreditCheck.new("5541808923795240")


    assert_equal [8,10,14,4,16,16,8,10], check.double
  end

  def test_digits_over_10_get_added
    skip

  end

end
