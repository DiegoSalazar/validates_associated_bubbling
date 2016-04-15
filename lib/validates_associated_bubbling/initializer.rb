# http://stackoverflow.com/questions/7387459/validates-associated-with-models-error-message
# compare to activerecord/lib/active_record/validations/associated.rb

module ActiveRecord
  module Validations
    class AssociatedBubblingValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        Array(value).reject(&:valid?).each do |v|
          v.errors.full_messages.each do |msg|
            record.errors.add attribute, msg, options.merge(value: value)
          end
        end
      end

      def validate_each(record, attribute, value)
        Array(value).reject(&:valid?).each do |v|
          v.errors.to_hash.each do |k, v|
            record.errors.add k, v, options.merge(value: value)
          end
        end
      end

    end

    module ClassMethods
      def validates_associated_bubbling(*attr_names)
        validates_with AssociatedBubblingValidator, _merge_attributes(attr_names)
      end

      def patient_evaluation_validates_associated_bubbling(*attr_names)
        validates_with PatientEvaluationAssociatedBubblingValidator, _merge_attributes(attr_names)
      end
    end
  end
end

