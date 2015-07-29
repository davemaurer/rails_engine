require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  test "transactions are not valid without an invoice id" do
    trans = transactions(:transaction_one)
    trans.invoice_id = nil

    refute trans.valid?

    trans.invoice_id = 1

    assert trans.valid?
  end

  test "transactions are not valid without a credit card number" do
    trans = transactions(:transaction_one)
    trans.credit_card_number = " "

    refute trans.valid?

    trans.credit_card_number = "4654405418249632"

    assert trans.valid?
  end

  test "transactions are not valid without a result" do
    trans = transactions(:transaction_one)
    trans.result = nil

    refute trans.valid?

    trans.result = "failure"

    assert trans.valid?
  end

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
