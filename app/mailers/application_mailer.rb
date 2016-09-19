class ApplicationMailer < ActionMailer::Base
  default from: "Red Not Blue <rednotblue@posteo.net>"
  default to: "Red not Blue <rednotblue@posteo.net>"
  layout 'mailer'
end
