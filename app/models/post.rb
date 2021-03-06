class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title, presence: true
  validates :content, length: {in: 1..140}
  validates :image, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
end
