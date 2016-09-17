class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :title, presence: true
  validates :summary, presence: true
  validates :post_content, presence: true
  has_attachments :photo, maximum: 5
  has_attachments :video, maximum: 1
end
