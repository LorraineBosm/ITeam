# Preview all emails at http://localhost:3000/rails/mailers/news_mailer
class NewsMailerPreview < ActionMailer::Preview
  def device_fixed_update_preview
    NewsMailer.device_fixed_update(Agreement.first, User.first)
  end
end
