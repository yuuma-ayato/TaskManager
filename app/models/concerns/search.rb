require 'active_support'

module Search
  extend ActiveSupport::Concern

  included do
    scope :what_content, -> (content) { where("content LIKE ?","%#{ content }%") if content.present?}
    scope :what_status, -> (status) { where( status: status ) if status.present?}
    scope :what_priority, -> (priority) { where( priority: priority ) if priority.present?}
    scope :hide_completed, -> (hide_completed) { where.not( status: 2 ) if hide_completed.present? }
    scope :what_label, -> (label_id) { joins(:labels).where(labels:{ id: label_id }) if label_id.present? }
  end
end
