class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :who
      t.text :quote
      t.references :user

      t.timestamps
    end
  end
end
