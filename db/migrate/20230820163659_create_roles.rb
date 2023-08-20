# frozen_string_literal: true

class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.timestamps
      t.string :name, null: false
      t.string :description, null: false
    end
  end
end
