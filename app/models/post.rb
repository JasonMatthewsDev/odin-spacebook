class Post < ActiveRecord::Base
  validates :content, presence: true, length: { minimum: 2 }
  
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likers, through: :likes, source: :user
end
