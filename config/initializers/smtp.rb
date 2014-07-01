if Rails.env.production?
  ActionMailer::Base.smtp_settings = {
      port:           '587',
      address:        'smtp.mandrillapp.com',
      user_name:      ENV['MANDRILL_USERNAME'],
      password:       ENV['MANDRILL_APIKEY'],
      # TODO: update herokuapp URL
      domain:         'food-trucks.herokuapp.com',
      authentication: :plain
  }
  ActionMailer::Base.delivery_method = :smtp
elsif Rails.env.development?
  ActionMailer::Base.smtp_settings = {
    address: 'localhost',
    port: 1025
  }
end
