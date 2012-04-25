class UsersController < ApplicationController
  before_filter :cross_user_edit_protection, only: [:edit, :update, :destroy]

  def cross_user_edit_protection
    @user = User.find(params[:id])
    redirect_to edit_user_path(current_user) unless @user == current_user
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def show
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  def edit
    # @user assigned in before_filter
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # @user assigned in before_filter

    if @user.update_attributes(params[:user])
      redirect_to root_url, notice: 'Preferences have been updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    # @user assigned in before_filter
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
