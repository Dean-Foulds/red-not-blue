class Comment < ApplicationRecord
  belongs_to :post
  # validates :content, presense: true
  # validates :post_id, presense: true
end
