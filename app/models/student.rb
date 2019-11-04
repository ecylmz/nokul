# frozen_string_literal: true

class Student < ApplicationRecord
  # Ldap
  include LDAP::Trigger
  ldap_trigger :user

  # relations
  belongs_to :user
  belongs_to :unit
  has_one :identity, dependent: :destroy
  has_many :calendars, -> { Calendar.active }, through: :unit
  has_many :curriculums, through: :unit
  has_many :course_enrollments, dependent: :destroy

  # scopes
  # TODO: Query will be organized according to activity status
  scope :active, -> { where(permanently_registered: true) }

  # validations
  validates :unit_id, uniqueness: { scope: %i[user] }
  # TODO: Will set equal_to: N, when we decide about student numbers
  validates :student_number, presence: true, uniqueness: true, length: { maximum: 255 }
  validates :permanently_registered, inclusion: { in: [true, false] }
  validates :semester, numericality: { greater_than: 0 }
  validates :year, numericality: { greater_than_or_equal_to: 0 }

  # delegations
  delegate :addresses, to: :user

  # background jobs
  after_create_commit :build_identity_information, if: proc { identity.nil? }

  private

  def build_identity_information
    Kps::IdentitySaveJob.perform_later(user, id)
  end
end
