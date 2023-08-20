# frozen_string_literal: true

class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.references :sender, null: false
      t.references :patient_record, foreign_key: true, null: false
      t.string :title, null: false
      t.text :content, null: false
      t.timestamps
    end

    add_foreign_key :messages, :users, column: :sender_id, primary_key: :id
  end
end
