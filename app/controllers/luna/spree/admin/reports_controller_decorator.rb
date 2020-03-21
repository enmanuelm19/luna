module Luna
  module Spree
    module Admin
      module ReportsControllerDecorator
        def initialize
          super
          ::Spree::Admin::ReportsController.add_available_report!(:search_events, :search_events_description)
        end

        def search_events
          params[:q] = {} unless params[:q]
          @search = ::SearchEvent.ransack(params[:q])
          @search_events = @search.result.group_by(&:body)
          render '/spree/admin/reports/search_events'
        end
      end
    end
  end
end

::Spree::Admin::ReportsController.prepend(Luna::Spree::Admin::ReportsControllerDecorator)
