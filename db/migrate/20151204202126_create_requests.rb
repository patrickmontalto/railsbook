class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.boolean :accepted
      
      t.timestamps null: false
    end
  end
end
