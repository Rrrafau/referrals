# frozen_string_literal: true

class Referral < ApplicationRecord
  belongs_to :patient_record

  has_one :patient_log, as: :loggable
  has_one :target_organization, class_name: 'Organization'
  has_one :sender_organization, class_name: 'Organization'
  has_one :referrer, class_name: 'User'

  validates_associated :target_organization, :sender_organization, :referrer
  validates :patient_record, presence: true
end
