module Luna
  module Spree
    module ProductsControllerDecorator
      def index
        super
        ::SearchEvent.create(body: params[:keywords].upcase) if params[:keywords]
      end
    end
  end
end

::Spree::ProductsController.prepend Luna::Spree::ProductsControllerDecorator
