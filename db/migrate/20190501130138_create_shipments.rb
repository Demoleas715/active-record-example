class CreateShipments < ActiveRecord::Migration[5.1]
  def change
    create_table :shipments do |t|
      t.float :weight
      t.float :height
      t.float :width
      t.float :depth

      t.timestamps
    end
  end
end
