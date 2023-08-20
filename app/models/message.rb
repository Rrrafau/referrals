# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :patient_record

  has_one :patient_log, as: :loggable

  validates :title, length: { in: 5..255 }
  validates :content, length: { in: 5..2000 }
  validates :sender, :patient_record, presence: true
end
