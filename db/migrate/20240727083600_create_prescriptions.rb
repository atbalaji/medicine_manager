class CreatePrescriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :prescriptions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :medicine, null: false, foreign_key: true
      t.string :dosage, null: false
      t.string :frequency, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false

      t.timestamps
    end
  end
end
