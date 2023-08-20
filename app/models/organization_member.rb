# frozen_string_literal: true

class OrganizationMember < ApplicationRecord
  belongs_to :organization
  belongs_to :user

  validates :organization, :user, presence: true
  validates_uniqueness_of :user_id, scope: :organization_id
end
