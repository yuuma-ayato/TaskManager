require 'active_support'

module Sort
  extend ActiveSupport::Concern

  included do
    scope :limit_desc, -> (sort) { order(limit: :DESC) if sort == "limit_desc" }
    scope :status_asc, -> (sort) { order(status: :ASC) if sort == "status_asc" }
    scope :priority_desc, -> (sort) { order(priority: :DESC) if sort == "priority_desc" }
  end
end
