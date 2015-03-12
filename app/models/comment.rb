class Comment < ActiveRecord::Base
  validates :content, presence: true, length: { minimum: 2 }
  
  belongs_to :user
  belongs_to :post
end
