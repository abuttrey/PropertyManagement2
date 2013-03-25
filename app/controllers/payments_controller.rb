class PaymentsController < ApplicationController

 load_and_authorize_resource


  # GET /payments
  # GET /payments.json
  def index
   if current_user.has_role? :manager    
      @payments = Payment.all
      
   else
         
      @payments = current_user.payments
   end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @payments }
    end
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
    @payment = Payment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @payment }
    end
  end

  # GET /payments/new
  # GET /payments/new.json
  def new
    @payment = Payment.new
    @user = current_user
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @payment }
    end
  end

 
  # POST /payments
  # POST /payments.json
  def create
    @user = current_user
    @payment = Payment.new(params[:payment])
    @payment.ip_address = request.remote_ip
    @payment.user = current_user

    logger.fatal "FATAL INFO #{@payment.inspect}"

    respond_to do |format|
      if @payment.save
        if @payment.make_transaction  #make and verify transaction
          format.html { redirect_to @payment, notice: 'Payment was successfully created.' }
          format.json { render json: @payment, status: :created, location: @payment }
        else
          @payment.destroy
          format.html {render action: "failed"}
        end
      else
        format.html { render action: "new" }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

 
end
