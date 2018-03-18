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

  def test_sum_of_digits_over_10
    check = CreditCheck.new("5541808923795240")

    assert_equal [8,1,5,4,7,7,8,1], check.sum_over_10
  end

  def test_even_digits_of_number_gets_stored_in_new_array
    check = CreditCheck.new("5541808923795240")

    assert_equal [0,2,9,3,9,0,1,5], check.even_digits
  end

  def test_sum_of_all_digits
    check = CreditCheck.new("5541808923795240")

    assert_equal 70, check.total_sum
  end

  def test_sum_is_divisible_by_10_returns_true
    check = CreditCheck.new("5541808923795240")

    assert check.card_valid?
  end

  def test_correct_output_for_true_and_false
    check = CreditCheck.new("5541808923795240")
    check_2 = CreditCheck.new("4024007106512380")

    assert_equal "The number is valid!", check.card_valid?
    assert_equal "The number is invalid!", check_2.card_valid?
  end

  def test_amex_cards
    check_1 = CreditCheck.new("342804633855673")
    check_2 = CreditCheck.new("342801633855673")

    assert_equal "The number is valid!", check_1.card_valid?
    assert_equal "The number is invalid!", check_2.card_valid?
  end

  def test_card_checker_runs_all_methods
    check_1 = CreditCheck.new("6011797668867828")
    check_2 = CreditCheck.new("6011797668868728")

    assert_equal "The number is valid!", check_1.card_checker
    assert_equal "The number is invalid!", check_2.card_checker
  end
end
