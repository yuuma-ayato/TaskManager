require 'active_support'

module Search
  extend ActiveSupport::Concern

  included do
    scope :what_content, -> (content) { where("content LIKE ?","%#{ content }%") if content.present?}
  end
end
