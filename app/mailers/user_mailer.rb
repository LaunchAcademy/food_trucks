class UserMailer < ActionMailer::Base
  default from: 'noreply@foodtruckreviews.com'

  def review_notice_email(review)
    @user = review.user
    @food_truck = review.food_truck
    mail(to: @user.email, subject: 'Someone has written a new' \
    ' review on your food truck!')
  end
end
