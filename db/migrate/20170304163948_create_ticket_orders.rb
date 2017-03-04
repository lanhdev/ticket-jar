class CreateTicketOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :ticket_orders do |t|
      t.references :ticket_type, foreign_key: true
      t.integer :quantity
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.decimal :total_price

      t.timestamps
    end
  end
end
