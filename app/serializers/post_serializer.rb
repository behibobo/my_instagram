class PostSerializer < ActiveModel::Serializer
  attributes :id, :body, :user, :image, :created_at

  def user
    object.user.full_name
  end

  def image
    "http://story.coding-lodge.com#{object.image}" unless object.image.nil?
  end
end
