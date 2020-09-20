class CreateNewUsersJob < ApplicationJob
  queue_as :default

  def perform(*args)
    month = DateTime.now.in_time_zone("Mexico City").strftime('%Y%m')
    charge_user = ChargeUser.where(month: month).last
    new_users = []
    binding.pry
    if charge_user
      file = Rails.root.join('public', 'uploads', 'charge_user', 'url', "#{charge_user.id}", "#{charge_user.url.identifier}")
      csv_content = CSV.read("favorite_foods.csv")
      csv_content.each do |row|
        name = row[0].downcase
        username = row[1].downcase.strip
        region = row[2].downcase.strip
        role = row[3].downcase.strip
        user = User.find_by(username: username)
        password = SecureRandom.hex(6)  
        new_users << [username, password]
        
        unless user
          User.create!(name: name, username: username, region: region, role: role, password: password, password_confirmation: password)
        end
      end
      #create csv attachment file
      ChargeUserMailer.send_users(new_users).deliver
      charge_user.destroy!
    end
  end
end
