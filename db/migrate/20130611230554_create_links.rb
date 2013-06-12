class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.integer :post_id
      t.string :link_body

      t.timestamps
    end
  end
end
