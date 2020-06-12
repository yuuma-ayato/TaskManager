require 'active_support'

module Sort
  extend ActiveSupport::Concern

  included do
    scope :limit_desc, -> { order(limit: :desc) }
  end
end
