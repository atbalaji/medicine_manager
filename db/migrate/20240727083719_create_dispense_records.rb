class CreateDispenseRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :dispense_records do |t|
      t.references :prescription, null: false, foreign_key: true
      t.datetime :dispense_time, null: false

      t.timestamps
    end
  end
end
