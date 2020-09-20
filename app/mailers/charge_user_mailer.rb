class ChargeUserMailer < ApplicationMailer
  default from: 'humberto-_-lzc@hotmail.com'
 
  def send_users(new_users)
    @new_users = new_users

    
    mail(to: 'huarci@gmail.com', subject: 'New users') do |format|
        format.text { render plain: "#{@new_users.to_s}" }
        format.html { render html: "<p>#{@new_users.to_s}</p>".html_safe }
    end  
  end
end
