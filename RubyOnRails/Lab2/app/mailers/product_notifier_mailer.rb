class ProductNotifierMailer < ApplicationMailer


  def new_product_mail
    mail(to: "Mariam@gmail.com", subject: "New product created")
  end

end
