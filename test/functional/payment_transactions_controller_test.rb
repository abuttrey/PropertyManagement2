require 'test_helper'

class PaymentTransactionsControllerTest < ActionController::TestCase
  setup do
    @payment_transaction = payment_transactions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payment_transactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payment_transaction" do
    assert_difference('PaymentTransaction.count') do
      post :create, payment_transaction: { response: @payment_transaction.response }
    end

    assert_redirected_to payment_transaction_path(assigns(:payment_transaction))
  end

  test "should show payment_transaction" do
    get :show, id: @payment_transaction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @payment_transaction
    assert_response :success
  end

  test "should update payment_transaction" do
    put :update, id: @payment_transaction, payment_transaction: { response: @payment_transaction.response }
    assert_redirected_to payment_transaction_path(assigns(:payment_transaction))
  end

  test "should destroy payment_transaction" do
    assert_difference('PaymentTransaction.count', -1) do
      delete :destroy, id: @payment_transaction
    end

    assert_redirected_to payment_transactions_path
  end
end
