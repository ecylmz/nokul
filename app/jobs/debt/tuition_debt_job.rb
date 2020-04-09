# frozen_string_literal: true

module Debt
  class TuitionDebtJob < ApplicationJob
    queue_as :high

    def perform(unit_ids, term_id)
      units = Unit.where(id: unit_ids.reject(&:empty?)).joins(:students).select { |u| u.students.exists? }

      Debt::Tuition::Dispatch.perform(units.flatten, term_id)
    end
  end
end
