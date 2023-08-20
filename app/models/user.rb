# frozen_string_literal: true

class User < ApplicationRecord
  has_many :roles, through: :user_roles
  has_one :patient_record

  validates :name, presence: true
end
