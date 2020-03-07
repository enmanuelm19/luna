module Spree
  class PaymentMailer < BaseMailer
    def accepted_payment(order, resend = false)
      @order = order.respond_to?(:id) ? order : Spree::Order.find(order)
      @store = Spree::Store.current
      subject = (resend ? "[#{Spree.t(:resend).upcase}] " : '')
      subject += "#{@store.name} #{Spree.t('payment_mayler.accepted_payment.subject')}"
      mail(to: @order.email, from: from_address, subject: subject, cc: @store.mail_from_address)
    end

    def voided_payment(order, resend = false)
      @order = order.respond_to?(:id) ? order : Spree::Order.find(order)
      @store = Spree::Store.current
      subject = (resend ? "[#{Spree.t(:resend).upcase}] " : '')
      subject += "#{@store.name} #{Spree.t('payment_mayler.voided_payment.subject')}"
      mail(to: @order.email, from: from_address, subject: subject, cc: @store.mail_from_address)
    end
  end
end
