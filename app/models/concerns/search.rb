require 'active_support'

module Search
  extend ActiveSupport::Concern

  included do
    scope :what_content, -> (content) { where("content LIKE ?","%#{ content }%") if content.present?}
    scope :what_status, -> (status) { where( status: status ) if status.present?}
  end
end
