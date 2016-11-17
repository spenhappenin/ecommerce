class BeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.be_mailer.rake.subject
  #
  def rake
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.be_mailer.routes.subject
  #
  def routes
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
