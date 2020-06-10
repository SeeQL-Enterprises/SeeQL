class ApplicationMailer < ActionMailer::Base
    default from: 'support@seeql.dev'
    layout 'mailer'
end
