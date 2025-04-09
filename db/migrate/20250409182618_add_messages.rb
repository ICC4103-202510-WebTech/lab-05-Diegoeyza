class AddMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :messages do |t|
      t.integer :chat_id, null: false 
      t.integer :user_id, null: false 
      t.string :body, null: false 
      t.date :created_at, null: false
      t.date :updated_at, null: false
      t.timestamps
    end 
  end
end