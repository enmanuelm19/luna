module Luna
  module Spree
    module OrderDecorator
      ::Spree::Order.class_eval do
        has_many :payment_methods, through: :payments
      end
    end
  end
end

::Spree::Order.prepend(Luna::Spree::OrderDecorator)
