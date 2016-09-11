class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.references :post, foreign_key: true
      t.integer :upvote
      t.string :avatar

      t.timestamps
    end
  end
end
