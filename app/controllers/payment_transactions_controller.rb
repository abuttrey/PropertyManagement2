class PaymentTransactionsController < ApplicationController

 load_and_authorize_resource

  # GET /payment_transactions
  # GET /payment_transactions.json
  def index
    @payment_transactions = PaymentTransaction.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @payment_transactions }
    end
  end

  # GET /payment_transactions/1
  # GET /payment_transactions/1.json
  def show
    @payment_transaction = PaymentTransaction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @payment_transaction }
    end
  end

  # GET /payment_transactions/new
  # GET /payment_transactions/new.json
  def new
    @payment_transaction = PaymentTransaction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @payment_transaction }
    end
  end

  # GET /payment_transactions/1/edit
  def edit
    @payment_transaction = PaymentTransaction.find(params[:id])
  end

  # POST /payment_transactions
  # POST /payment_transactions.json
  def create
    @payment_transaction = PaymentTransaction.new(params[:payment_transaction])

    respond_to do |format|
      if @payment_transaction.save
        format.html { redirect_to @payment_transaction, notice: 'Payment transaction was successfully created.' }
        format.json { render json: @payment_transaction, status: :created, location: @payment_transaction }
      else
        format.html { render action: "new" }
        format.json { render json: @payment_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /payment_transactions/1
  # PUT /payment_transactions/1.json
  def update
    @payment_transaction = PaymentTransaction.find(params[:id])

    respond_to do |format|
      if @payment_transaction.update_attributes(params[:payment_transaction])
        format.html { redirect_to @payment_transaction, notice: 'Payment transaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @payment_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_transactions/1
  # DELETE /payment_transactions/1.json
  def destroy
    @payment_transaction = PaymentTransaction.find(params[:id])
    @payment_transaction.destroy

    respond_to do |format|
      format.html { redirect_to payment_transactions_url }
      format.json { head :no_content }
    end
  end
end
