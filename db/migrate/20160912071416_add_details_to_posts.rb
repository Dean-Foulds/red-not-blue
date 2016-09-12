class AddDetailsToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :title, :string
    add_column :posts, :post_content, :text
    add_column :posts, :video, :string
    add_reference :posts, :user, foreign_key: true
    add_reference :posts, :comment, foreign_key: true
  end
end
