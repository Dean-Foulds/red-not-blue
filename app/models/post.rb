class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_attachments :photo, maximum: 5
  has_attachments :video, maximum: 1
  # validates :title, presense: true, uniqness: true
  # validates :summary, presense: true, uniqness: true
end
