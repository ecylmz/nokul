# frozen_string_literal: true

namespace :tenant do
  namespace :units do
    desc 'Reproduce unit sources'
    task reproduce: :environment do
      Nokul::Tenant::Units.reproduce
    end
  end
end
