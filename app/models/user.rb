class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]
  has_one_attached :image

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true


  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
    if user
      user
    else
      user = User.create(username: data['name'],
         email: data['email'],
         password: Devise.friendly_token[0,20],
         uid: access_token[:uid],
         provider: access_token[:provider]
      )
    end
  end

  def is_admin?
    self.user_role == 1
  end
end
