class CreateDeliveryItems < ActiveRecord::Migration[7.0]
  def change
    create_table :delivery_items do |t|
      t.string :name
      t.date :arrival_date
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
