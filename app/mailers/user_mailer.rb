class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.contract.subject
  #
  def contract
    @bid = params[:bid]

    attachments["#{@bid.listing.user.company_name}.pdf"] = WickedPdf.new.pdf_from_string(
      render_to_string(pdf: 'pages/pdf', page_size: 'A4', template: 'pages/pdf.html.erb', layout: 'pdf.html'), {
        orientation: "Portrait",
        lowquality: true,
        zoom: 1,
        dpi: 75 }
    )

    mail(to: 'fernando.requeni@outlook.com', subject: 'Contract Bid', from: 'Eztenda <noreplywineorders@gmail.com>', bid: @bid)
  end
end
