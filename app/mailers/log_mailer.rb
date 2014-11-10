class LogMailer < ActionMailer::Base
  default from: "testifd123456@gmail.com"


  def mailer(incident)
  	@entries = incident.entries
  	@incident = incident
  	@firehouse_email = "fantasy_sluggers@yahoo.com"
  	mail(to:@firehouse_email, subject: "#{@incident.name} Log File")

  end

end
