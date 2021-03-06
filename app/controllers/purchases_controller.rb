class PurchasesController < ApplicationController
  def purchases
    if current_user.admin?
      Purchase
    else
      current_user.purchases
    end
  end

  def tag
    @purchases = purchases.tagged_with(params[:tag_name])
    render :index
  end

  # GET /purchases
  # GET /purchases.json
  def index
    @purchases = purchases.recent

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @purchases }
    end
  end

  def show
    @purchase = current_user.purchases.find(params[:id])

    render @purchase if request.xhr?
  end

  # GET /purchases/new
  # GET /purchases/new.json
  def new
    @purchase = current_user.purchases.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @purchase }
    end
  end

  # GET /purchases/1/edit
  def edit
    @purchase = current_user.purchases.find(params[:id])
  end

  # POST /purchases
  # POST /purchases.json
  def create
    @purchase = current_user.purchases.build(params[:purchase])

    respond_to do |format|
      if @purchase.save
        Notifications.new_purchase(@purchase).deliver
        format.html { redirect_to @purchase, notice: 'Purchase was successfully created.' }
        format.json { render json: @purchase, status: :created, location: @purchase }
      else
        format.html { render action: "new" }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /purchases/1
  # PUT /purchases/1.json
  def update
    @purchase = current_user.purchases.find(params[:id])

    respond_to do |format|
      if @purchase.update_attributes(params[:purchase])
        format.html { redirect_to @purchase, notice: 'Purchase was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchases/1
  # DELETE /purchases/1.json
  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy

    respond_to do |format|
      format.html { redirect_to purchases_url }
      format.json { head :no_content }
    end
  end

  skip_before_filter :verify_authenticity_token, only: :email
  skip_before_filter :authenticate_user!, only: :email

  def email
    Purchase.create_from_email(params)
    render nothing: true, status: 200
  end
end
