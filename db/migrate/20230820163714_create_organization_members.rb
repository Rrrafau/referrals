# frozen_string_literal: true

class CreateOrganizationMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :organization_members do |t|
      t.references :user, foreign_key: true, null: false
      t.references :organization, foreign_key: true, null: false
      t.timestamps
    end
  end
end
