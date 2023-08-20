class CreatePatientLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :patient_logs do |t|
      t.references :loggable, polymorphic: true, null: false
      t.references :patient_record, foreign_key: true
      t.timestamps
    end
  end
end
