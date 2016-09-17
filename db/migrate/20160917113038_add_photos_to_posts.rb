class AddPhotosToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :photos, :string
  end
end
