require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @register = cash_register.new 100
    @transaction = transaction.new 10
  end

  def test_accept_money
    @transaction.amount_paid = 10

    previous_amount = @register.total_money
    @register.accept_money @transaction
    current_amount = @register.total_money

    assert_equal preivous_amount + 10, current_amount
  end

  def test_change
    @transaction.amount_paid = 100
    target_value = @transaction.amount_paid - @transaction.item_cost

    assert_equal target_value, @register.change @transaction
  end
end
