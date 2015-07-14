class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :subject
      t.text :content
      t.integer :status
      t.integer :priority
      t.integer :user_id
      t.integer :assignee_id

      t.timestamps null: false
    end
    add_index :tickets, :status
    add_index :tickets, :priority
    add_index :tickets, :user_id
    add_index :tickets, :assignee_id
  end
end
