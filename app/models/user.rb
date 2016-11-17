class User < ApplicationRecord
  after_create :send_signup_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

    def self.from_omniauth(auth)
    	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    		user.email = auth.info.email
    		user.password = Devise.friendly_token
    		# Devise.friendly_token = 'some random password'
    	end
    end

    def send_signup_email
      # SignupMailer.new_signup(user).
    end

  has_many :stores
end
