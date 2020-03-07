module Luna
  module Spree
    module Admin
      module PaymentsControllerDecorator
        ::Spree::Admin::PaymentsController.class_eval do
          before_action :send_payment_captured_notification, only: :fire
        end

        private

          def send_payment_notification
            send_payment_captured_notification if params[:e] == 'capture'
            send_payment_void_notification if params[:e] == 'void'
          end

          def send_payment_captured_notification
            ::Spree::PaymentMailer.accepted_payment(@order, true).deliver_later
          end

          def send_paymend_void_notification
            ::Spree::PaymentMailer.voided_payment(@order, true).deliver_later
          end
      end
    end
  end
end

::Spree::Admin::PaymentsController.prepend(Luna::Spree::Admin::PaymentsControllerDecorator)
