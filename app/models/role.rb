# frozen_string_literal: true

class Role < ApplicationRecord
  has_many :user_roles
  has_many :users, through: :user_roles

  validates :name, :description, presence: true
end
