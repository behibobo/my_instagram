class User < ApplicationRecord
    has_secure_password

    validates_uniqueness_of(:email)
    
    has_many :posts, dependent: :destroy
    
    def self.contains(column_name, prefix)
        where("lower(#{column_name}) like ?", "%#{prefix.downcase}%")
    end

    def full_name
        "#{self.first_name} #{self.last_name}"
    end
end
