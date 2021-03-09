class PostSerializer < ActiveModel::Serializer
  attributes :id, :body, :image, :created_at

  belongs_to :user

  def image
    "http://story.coding-lodge.com#{object.image}" unless object.image.nil?
  end
end
