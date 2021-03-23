class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :buy          ,        null: false, foregin_key: true
      t.string     :postal_code  ,        null: false
      t.integer    :shipping_area_id ,     null: false
      t.string     :municipality  ,       null: false
      t.string     :address  ,             null: false
      t.string     :building_name
      t.string     :phone_number  ,        null: false



      t.timestamps
    end
  end
end
