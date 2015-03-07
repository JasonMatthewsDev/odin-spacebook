class Friendship < ActiveRecord::Base
  belongs_to :requester, class_name: 'User'
  belongs_to :requested, class_name: 'User'
end
