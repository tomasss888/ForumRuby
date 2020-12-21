# frozen_string_literal: true

# Role model
class Role < ApplicationRecord
  has_and_belongs_to_many :users, join_table: :users_roles

  # assigns what belongs to this model
  belongs_to :resource,
             polymorphic: true,
             optional: true

  # validation
  validates :resource_type,
            inclusion: { in: Rolify.resource_types },
            allow_nil: true

  scopify
end
