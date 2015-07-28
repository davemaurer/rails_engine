require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  test "transactions have an invoice_id" do
    assert_equal 1, transactions(:transaction_one).invoice_id
    refute_equal 0, transactions(:transaction_one).invoice_id
  end

  test "transactions have a credit card number" do
    assert_equal "4654405418249632", transactions(:transaction_one).credit_card_number
    refute_equal "4556666323455044", transactions(:transaction_one).credit_card_number
  end

  test "transactions have a result" do
    assert_equal "failure", transactions(:transaction_one).result
    refute_equal "success", transactions(:transaction_one).result
  end
end
