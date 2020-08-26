class User < ApplicationRecord
  has_many :meals
  has_many :comments
  has_many :commented_meals, :through => :comments, :source => :meal
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and 
 
  
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, 
          :omniauthable, omniauth_providers: [:google_oauth2]
          
  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    unless user
        user = User.create(email: data['email'],
           password: Devise.friendly_token[0,20]
        )
    end
    user
  end

end
