class SignupMailerPreview < ActionMailer::Preview
  def new_signup_preview
    user = User.first || User.create(name: 'Steve Jobs', email: 'steve@jobs.com')
    SignupMailer.new_signup(user)
  end
end
