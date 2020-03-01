module Spree
  class OrderMailer < BaseMailer
    def confirm_email(order, resend = false)
      @order = order.respond_to?(:id) ? order : Spree::Order.find(order)
      @store = Spree::Store.current
      subject = (resend ? "[#{Spree.t(:resend).upcase}] " : '')
      subject += "#{@store.name} #{Spree.t('order_mailer.confirm_email.subject')} ##{@order.number}"
      mail(to: @order.email, from: from_address, subject: subject, cc: @store.mail_from_address)
    end

    def cancel_email(order, resend = false)
      @order = order.respond_to?(:id) ? order : Spree::Order.find(order)
      @store = Spree::Store.current
      subject = (resend ? "[#{Spree.t(:resend).upcase}] " : '')
      subject += "#{@store.name} #{Spree.t('order_mailer.cancel_email.subject')} ##{@order.number}"
      mail(to: @order.email, from: from_address, subject: subject, cc: @store.mail_from_address)
    end
  end
end
