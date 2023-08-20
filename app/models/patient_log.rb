class PatientLog < ApplicationRecord
  belongs_to :loggable, polymorphic: true, foreign_key: :loggable_id
  belongs_to :patient_record

  validates_associated :loggable, :patient_record
end
