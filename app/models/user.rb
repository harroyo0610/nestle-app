class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :jwt_authenticatable, jwt_revocation_strategy: self,
         authentication_keys: [:login]
  
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  attr_writer :login

  enum role: {
    merchant: 'merchant',
    admin: 'admin'
  }

  def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end

  def login
    @login || self.username
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions&.dup
    if login = conditions&.delete(:login)
      where(conditions).where(["username = :value", { :value => login }])&.first
    elsif conditions&.has_key?(:username)
      conditions[:username]&.downcase! if conditions[:username]
      where(conditions.to_h)&.first
    end
  end

  def gravatar_url
    "https://panndora-topics.s3.us-east-2.amazonaws.com/panndoralogo.png"
  end

  def is_admin?
    self.role == 'admin'
  end
end
