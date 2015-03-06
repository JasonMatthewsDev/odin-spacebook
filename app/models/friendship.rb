class Friendship < ActiveRecord::Base
  belongs_to :requester, class: User
  belongs_to :requestee, class: User
end
