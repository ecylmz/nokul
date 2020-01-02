class AddSemesterRegistrationReferenceToCourseEnrollments < ActiveRecord::Migration[6.0]
  def change
    add_reference :course_enrollments, :semester_registration, null: false, foreign_key: true
  end
end
