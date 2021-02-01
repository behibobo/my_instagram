class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :full_name, :email, :avatar

  def full_name
    object.full_name
  end

  def avatar
    if object.avatar.nil?
      "http://story.coding-lodge.com/user.png"
    else
      "http://story.coding-lodge.com/#{object.avatar}"
    end
  end
end
