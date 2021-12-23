# frozen_string_literal: true

# Adds methods for managing status column.
# Add hold_status macros.
# Example:
# hold_status :draft, :published, :removed
module StatusHolder
  extend ActiveSupport::Concern

  included do
    class_attribute :_default_status, :_statuses, instance_writer: false
    self._statuses ||= []

    after_initialize { self.status ||= _default_status }
    validates :status, presence: true, inclusion: { in: ->(r) { r.class._statuses } }

    scope :with_status, ->(*statuses) { where(status: statuses.flatten.map(&:to_s)) }
    scope :except_status, ->(*statuses) { where.not(status: statuses.flatten.map(&:to_s)) }
  end

  def status
    read_attribute(:status).try(:to_sym)
  end

  def status=(value)
    value = value.try(:to_s)
    status_will_change! if value != status.to_s
    write_attribute(:status, value)
  end

  module ClassMethods
    # Add the status to the list of available status
    def hold_status(*names)
      names.flatten.map(&:to_sym).each do |status_name|
        self._default_status ||= status_name if _statuses.empty?
        self._statuses = _statuses | [status_name]

        unless singleton_class.method_defined? status_name
          define_singleton_method status_name do
            with_status(status_name)
          end
        end

        next if method_defined? "#{status_name}?"

        define_method "#{status_name}?" do
          status == status_name
        end
      end
    end
  end
end
