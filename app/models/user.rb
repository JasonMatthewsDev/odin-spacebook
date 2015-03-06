class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  
  has_many :requested_friends,  foreign_key: :requester_id, class: Friendship
  has_many :friend_invites,     foreign_key: :requestee_id, class: Friendship
  
  def self.from_omniauth(auth)
    if user = User.where(:email => auth.info.email).first()
       user
    else
      User.create!(:email => auth.info.email, :password => Devise.friendly_token[0,20])
    end
  end
end
  