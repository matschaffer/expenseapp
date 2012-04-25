class InvitesController < ApplicationController
  def new
  end

  def show
    @invite = Invite.find_by_token(params[:id])
    @household = invite.household
  end

  def create
    @invite = current_user.household.invites.create(params[:invite])
    if @invite.valid?
      Notifications.household_invite(current_user, @invite).deliver
      redirect_to root_path, notice: "Invite has been sent to #{@invite.sent_to}."
    else
      render action: 'new'
    end
  end
end
