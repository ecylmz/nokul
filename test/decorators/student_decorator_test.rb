# frozen_string_literal: true

require 'test_helper'

class StudentDecoratorTest < ActiveSupport::TestCase
  TOTAL_ECTS = 30

  setup do
    @student = StudentDecorator.new(students(:serhat))
  end

  test 'registrable_for_online_course? method' do
    assert_not StudentDecorator.new(students(:serhat_omu)).registrable_for_online_course?
    assert StudentDecorator.new(@student).registrable_for_online_course?
  end

  test 'enrollment_status method' do
    assert_not StudentDecorator.new(students(:serhat_omu)).enrollment_status
    assert_equal StudentDecorator.new(students(:john)).enrollment_status, :saved
    assert_equal @student.enrollment_status, :draft
  end

  test 'selectable_courses method' do
    courses = @student.selectable_courses.map { |row| row[1] }[0]
    assert_includes courses, [available_courses(:elective_course_2), false, translate('.already_enrolled_at_group')]
    assert_includes courses, [available_courses(:compulsory_course_2), true]
  end

  private

  def translate(key)
    t("studentship.course_enrollments.new#{key}")
  end
end
