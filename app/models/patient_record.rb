# frozen_string_literal: true

class PatientRecord < ApplicationRecord
  has_many :referrals
  has_many :messages
  belongs_to :user

  validates :user, presence: true
  validates_uniqueness_of :user_id
end
