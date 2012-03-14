class UserHouseholdController < ApplicationController
  def new
    @household = Household.new
  end

  def create
    @household = Household.new(params[:household])
    if @household.save
      current_user.household = @household
      current_user.save
      redirect_to root_path
    else
      render action: 'new'
    end
  end
end
