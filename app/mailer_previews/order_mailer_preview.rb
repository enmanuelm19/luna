class OrderMailerPreview
 #TODO: Ver si puedo utilizar factory_bot y ffaker para hacer los mock de los datos requeridos por los mails
 def confirm_email
  @order = Spree::Order.first
  Spree::OrderMailer.confirm_email(@order)
 end
end
