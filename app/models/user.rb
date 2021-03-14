class User < ApplicationRecord
  has_many :meals
  has_many :comments
  has_many :meal_foods, :through => :meals 
  has_many :foods, :through => :meal_foods, :source => :food
  has_many :meal_comments, :through => :meals, :source => :comments
  has_many :saved_meals, :through => :comments, :source => :meal

  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and 
 
  
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, 
          :omniauthable, :omniauth_providers => [:google_oauth2]
          
  # def self.from_omniauth(access_token)
  #   data = access_token.info
  #   user = User.where(email: data['email']).first

  #   unless user
  #       user = User.create(email: data['email'],
  #          password: Devise.friendly_token[0,20]
  #       )
  #   end
  #   user
  # end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

end
