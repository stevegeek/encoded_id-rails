# frozen_string_literal: true

require "active_record"
require "encoded_id"

module EncodedId
  module Rails
    module Model
      def self.included(base)
        base.extend(EncoderMethods)
        base.extend(FinderMethods)
        base.extend(QueryMethods)
      end

      def encoded_id_hash
        return unless id
        return @encoded_id_hash if defined?(@encoded_id_hash) && !id_changed?
        self.class.encode_encoded_id(id)
      end

      def encoded_id
        return unless id
        return @encoded_id if defined?(@encoded_id) && !id_changed?
        @encoded_id = self.class.encode_encoded_id(id)
      end

      def slugged_encoded_id
        return unless id
        return @slugged_encoded_id if defined?(@slugged_encoded_id) && !id_changed?
        with = EncodedId::Rails.configuration.slug_method_name
        separator = EncodedId::Rails.configuration.slugged_id_separator
        encoded = encoded_id
        return unless encoded
        @slugged_encoded_id = EncodedId::Rails::SluggedId.new(id_part: encoded, slug_part: send(with.to_s), separator: separator).slugged_id
      end
      end

      # By default slug created from class name, but can be overridden
      def name_for_encoded_id_slug
        class_name = self.class.name
        raise StandardError, "Class must have a `name`, cannot create a slug" if !class_name || class_name.blank?
        class_name.underscore
      end

      # When duplicating an ActiveRecord object, we want to reset the memoized encoded_id
      def dup
        super.tap do |new_record|
          new_record.send(:remove_instance_variable, :@encoded_id) if new_record.instance_variable_defined?(:@encoded_id)
          new_record.send(:remove_instance_variable, :@slugged_encoded_id)  if new_record.instance_variable_defined?(:@slugged_encoded_id)
        end
      end
    end
  end
end
