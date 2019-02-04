class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title, presence: true
  validates :content, length: {in: 1..140}
  belongs_to :user
end
