module AgreementsHelper
  def send_emails agreement
    agreement.users.each do |user|
      NewsMailer.device_fixed_update(agreement, user).deliver
    end
  end
end
