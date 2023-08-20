# frozen_string_literal: true

class UserRole < ApplicationRecord
  belongs_to :user
  belongs_to :role

  validates :user, :role, presence: true
end
