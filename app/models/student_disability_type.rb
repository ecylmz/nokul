# frozen_string_literal: true

class StudentDisabilityType < ApplicationRecord
  include ReferenceCallbacks
  include ReferenceSearch
  include ReferenceValidations

  # relations
  has_many :prospective_students, dependent: :nullify
end
