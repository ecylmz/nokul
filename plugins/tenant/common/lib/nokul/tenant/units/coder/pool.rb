# frozen_string_literal: true

module Nokul
  module Tenant
    module Units
      class Coder
        class Pool
          include Support::Structure.of %i[
            starting
            ending
            owner
            weight
            pattern
            reserved
          ].freeze

          attr_reader :coder

          def after_initialize
            @coder = Codification::Unit.code_generator(starting: starting,
                                                       ending:   ending,
                                                       pattern:  pattern,
                                                       memory:   Memory.instance)
          end

          def score_of(unit)
            predicator = owner + '?'
            (unit.send(predicator) ? 1 : 0) * weight
          end

          def code
            coder.run
          end
        end

        class Pools < Support::Collection; end
      end
    end
  end
end
