# frozen_string_literal: true

class CourseAssessmentMethod < ApplicationRecord
  # enums
  enum status: { no_grade_entered: 0, draft: 1, saved: 2 }

  # relations
  belongs_to :assessment_method
  belongs_to :course_evaluation_type
  has_many :grades, dependent: :destroy
  accepts_nested_attributes_for :grades

  # validations
  validates :percentage, numericality: {
    only_integer:             true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to:    100
  }
  validates :assessment_method, uniqueness: { scope: :course_evaluation_type }

  # delegates
  delegate :available_course, to: :course_evaluation_type
  delegate :name, to: :assessment_method

  # custom methods
  def grades_under_authority_of(employee)
    grades.where(course_enrollment: available_course.enrollments_under_authority_of(employee))
  end

  def build_grades_for(enrollments)
    grades.build(enrollments.collect { |enrollment| { course_enrollment_id: enrollment.id } })
  end

  def fully_graded?
    enrollment_ids = available_course.saved_enrollments.ids
    grades.where.not(point: nil).where(course_enrollment_id: enrollment_ids).count == enrollment_ids.count
  end
end
