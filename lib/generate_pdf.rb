module Hackney
  module ServiceCharge
    class Generate_pdf

      def initialize(template_path:, style_path: '', pdf_gateway:)
        @template_path = template_path
        @style_path = style_path
        @pdf_gateway = pdf_gateway
      end

      def execute(payment_ref:, lessee_full_name:, correspondence_address_1:, correspondence_address_2:, correspondence_address_3:, correspondence_postcode:, lessee_short_name:, property_address:, arrears_letter_1_date:, total_collectable_arrears_balance:)
        date = Time.now.strftime("%d/%m/%Y")
        template = File.open(@template_path).read
        css_styles =  File.open(@style_path).read
        html = ERB.new(template).result(binding)
         @pdf_gateway.generate_pdf(html)
      end
    end
  end
end

