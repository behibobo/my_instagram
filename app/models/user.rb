class User < ApplicationRecord
    has_secure_password

    validates_uniqueness_of(:email)
    
    has_many :posts, dependent: :destroy
    has_many :direct_messages, foreign_key: :to_id

    has_many :followers_connections, -> { where(friends: {accepted: true}) }, foreign_key: :followee_id, class_name: "Friend"
    has_many :following_connections, -> { where(friends: {accepted: true}) }, foreign_key: :follower_id, class_name: "Friend"
    has_many :followers, through: :followers_connections, class_name: "User"
    has_many :followings, through: :following_connections, class_name: "User"

    def self.contains(column_name, prefix)
        where("lower(#{column_name}) like ?", "%#{prefix.downcase}%")
    end

    def full_name
        "#{self.first_name} #{self.last_name}"
    end
end
