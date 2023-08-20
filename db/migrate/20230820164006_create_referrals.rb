# frozen_string_literal: true

class CreateReferrals < ActiveRecord::Migration[7.0]
  def change
    create_table :referrals do |t|
      t.references :sender_organization, null: false
      t.references :target_organization, null: false
      t.references :referrer, null: false
      t.references :patient_record, null: false
      t.timestamps
    end

    add_foreign_key :referrals, :organizations, column: :sender_organization_id, primary_key: :id
    add_foreign_key :referrals, :organizations, column: :target_organization_id, primary_key: :id
    add_foreign_key :referrals, :users, column: :referrer_id, primary_key: :id
  end
end
