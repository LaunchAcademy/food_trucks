if Rails.env.development? || Rails.env.test? || Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address: 'localhost',
    port: 1025
  }
end
