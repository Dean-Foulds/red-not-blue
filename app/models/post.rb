class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_attachments :photos, maximum: 5
  has_attachments :videoss, maximum: 1
end
