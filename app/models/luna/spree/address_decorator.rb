module Luna
  module Spree
    module AddressDecorator
      ::Spree::Address.class_eval do
        SORTED_ADDRESS_FIELDS = ['firstname', 'lastname', 'company', 'country', 'state', 'city', 'address1', 'address2', 'zipcode', 'phone']
      end
    end
  end
end
::Spree::Address.prepend(Luna::Spree::AddressDecorator)
