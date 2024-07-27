class CreateMedicines < ActiveRecord::Migration[7.0]
  def change
    create_table :medicines do |t|
      t.string :name, null: false
      t.text :description
      t.string :dosage, null: false

      t.timestamps
    end
  end
end
