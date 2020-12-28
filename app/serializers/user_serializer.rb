class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :avatar

  def avatar
    if object.avatar.nil?
      "http://story.coding-lodge.com/user.png"
    else
      "http://story.coding-lodge.com/#{object.avatar}"
    end
  end
end
