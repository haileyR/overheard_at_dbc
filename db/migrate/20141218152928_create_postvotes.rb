class CreatePostvotes < ActiveRecord::Migration
  def change
    create_table :postvotes do |t|
      t.integer :up_count
      t.integer :down_count
      t.references :post
    end
  end
end
