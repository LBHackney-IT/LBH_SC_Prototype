module Hackney
  module ServiceCharge
    class PDF_gateway

      def initialize(breezy_pdf_gateway:, asset_host: )
        @breezy_pdf = breezy_pdf_gateway
        @asset_host = asset_host
      end

      def generate_pdf(html)
        pdf = @breezy_pdf.new(@asset_host, html)

        pdf.to_url
      end
    end
  end
end

