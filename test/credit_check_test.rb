require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/credit_check'
require 'pry'

class CreditCheckTest < Minitest::Test

  def test_it_exists
    check = CreditCheck.new(5541808923795240)

    assert_instance_of CreditCheck, check
  end
end
