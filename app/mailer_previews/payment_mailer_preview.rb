class PaymentMailerPreview
  def accepted_payment
    @order = Spree::Order.first
    Spree::PaymentMailer.accepted_payment(@order)
  end

  def voided_payment
    @order = Spree::Order.first
    Spree::PaymentMailer.voided_payment(@order)
  end
end
