# frozen_string_literal: true

class Organization < ApplicationRecord
  has_many :users

  validates :name, length: { in: 5..255 }, uniqueness: { case_sensitive: false }
  validates :description, length: { in: 5..2000 }
end
