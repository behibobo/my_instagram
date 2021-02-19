class Friend < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followings, class_name: "User", foreign_key: :followee_id
end
