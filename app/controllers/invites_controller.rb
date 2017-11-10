class InvitesController < ApplicationController
before_action :invite, only: [:show]

  def create
    @invite = Invite.create(team_id: @team.id, user_id: email_user)
    authorize! :create, @invite
    json_status = save_invite
    render json: {}, status: json_status
  end

  def show
    @invite = Invite.find_by(id: params[:id])
    authorize! :show, @invite
  end

  private

  def email_user
    User.find_by(email: params[:invite][:email])
  end
end
