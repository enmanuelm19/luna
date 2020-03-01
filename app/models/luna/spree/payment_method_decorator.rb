module Luna
  module Spree
    module PaymentMethodDecorator
      ::Spree::PaymentMethod.class_eval do
        scope :transfers, -> { where(type: 'Spree::PaymentMethod::Check') }
      end
    end
  end
end

::Spree::Order.prepend(Luna::Spree::PaymentMethodDecorator)
