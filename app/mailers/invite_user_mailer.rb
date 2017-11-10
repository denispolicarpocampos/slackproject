class InviteUserMailer < ApplicationMailer
  def send_invite(invite)
     @invite = invite
     mail(to: @invite.user.email, subject: "Hello you receive a invite for team #{@invite.team.slug} on SlackProject")
   end
end
