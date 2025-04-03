module Crono
  # Crono::CronoJob is a ActiveRecord model to store job state
  class CronoJob < ActiveRecord::Base
    self.table_name = 'crono_jobs'

    validates :job_id, presence: true, uniqueness: true

    scope :by_failed, -> { where(healthy: false) }
    scope :by_success, -> { where(healthy: true) }
    scope :by_new, -> { where(healthy: nil) }

    def self.outdated
      self
    end
  end
end
