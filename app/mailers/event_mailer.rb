class EventMailer < ApplicationMailer
    
    def event_mail(event, group_users)
        @event = event
        group_users.each do |group_user|
            mail to: group_user.user.email, bcc: ENV["GMAIL_USER"], subject: "#{@event.title}"
        end
    end
    
end
