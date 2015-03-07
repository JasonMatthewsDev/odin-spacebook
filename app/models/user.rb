class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  
  has_many :friendships, foreign_key: :requester_id
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: :requested_id
  
  has_many :friends, -> { where("friendships.accepted" => true)}, 
           through: :friendships, source: :requested
  has_many :inverse_friends, -> { where("friendships.accepted" => true)}, 
           through: :inverse_friendships, source: :requester
  
  has_many :sent_requests, -> { where("friendships.accepted" => false)},
           through: :friendships, source: :requested
  has_many :requests_received, -> { where("friendships.accepted" => false)},
           through: :inverse_friendships, source: :requester
  
  def is_friend?(u)
    u.in?(friends) || u.in?(inverse_friends)
  end
  
  def request_sent?(u)
    u.in?(sent_requests)
  end
  
  def request_received?(u)
    u.in?(requests_received)
  end
  
  def self.from_omniauth(auth)
    if user = User.where(:email => auth.info.email).first()
       user
    else
      User.create!(:email => auth.info.email, :password => Devise.friendly_token[0,20])
    end
  end
end
  