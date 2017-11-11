class InvitesController < ApplicationController

def create
  team = Team.find(params[:team_id])
  @invite = team.invites.build(user: user_by_email)
  authorize! :create, @invite
  json_status = save_invite
  render json: {}, status: json_status
end

  def show
    @invite = Invite.find(params[:id])
    authorize! :show, @invite
  end

  private

  def save_invite
    if @invite.save
      send_email
      :ok
    else
      :unprocessable_entity
    end
  end

  def send_email
    InviteUserMailer.send_invite(@invite).deliver_now
  end

  def user_by_email
    User.find_by(email: params[:invite][:email])
  end
end
