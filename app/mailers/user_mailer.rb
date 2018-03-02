class UserMailer < ApplicationMailer

  def purchase_mail(order,email_to)
    @order = order
    render_str = render_to_string(
      template: "orders/receipt",
      pdf: "receipt",
      layout: "pdf.html"
    )
    attachments["order_#{@order.id}.pdf"] = WickedPdf.new.pdf_from_string(
      render_str
    )
    mail(to: email_to, subject: "[Beliyuk] Pesanan Anda")
  end
end
