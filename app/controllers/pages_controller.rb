class PagesController < ApplicationController

  def pdf
    @bid = Bid.find(params[:id])
    respond_to do |format|
        format.html
        format.pdf do
            render pdf: "pages/pdf",
            page_size: 'A4',
            template: "pages/pdf.html.erb",
            layout: "pdf.html",
            orientation: "Portrait",
            lowquality: true,
            zoom: 1,
            dpi: 75
        end
    end
  end
end
