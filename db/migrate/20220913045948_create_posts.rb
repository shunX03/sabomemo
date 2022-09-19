class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.float :waste
      t.integer :evaluation, defalut: 1
      t.integer :user_id
      t.timestamps
    end
  end
end
