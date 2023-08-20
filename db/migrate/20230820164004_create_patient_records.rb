# frozen_string_literal: true

class CreatePatientRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :patient_records do |t|
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
