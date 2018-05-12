class NewsMailer < ApplicationMailer
  default from: 'no-reply@iteam.com'

  def device_fixed_update(agreement, user)
    @agreement = agreement
    @user = user
    mail(to: @user.email, subject: 'Статус ремонта изменился')
  end
end
