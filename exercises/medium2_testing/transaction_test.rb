require 'minitest/autorun'

require_relative 'transaction'

class TransactionTest < MiniTest::Test
  def setup
    @transaction = Transaction.new 200
  end

  def test_prompt_for_payment
    input = StringIO.new("210\n")
    @transaction.prompt_for_payment input: input

    assert_equal 210, @transaction.amount_paid
  end
end
