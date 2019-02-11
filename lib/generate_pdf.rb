require 'sinatra'

module Hackney
  module ServiceCharge
    class Generate_pdf

      def initialize(template_path:, style_path:)
        @template_path = template_path
        @style_path = style_path
      end

      def execute
        set_variables
        asset_host = "http://localhost:4567"

        template = File.open(@template_path).read

        css_styles =  File.open(@style_path).read

        html = ERB.new(template).result(binding)

        pdf = BreezyPDF::HTML2PDF.new(asset_host, html)

        # file = pdf.to_file.read
        @pdf_url = pdf.to_url
      end

      private

      def set_variables
        @date = '03/05/2018'
        @payment_ref = '123123123'
        @lessee_full_name = 'Mr Poopy Butthole'
        @correspondence_address_1 = '1 Some st'
        @correspondence_address_2 = 'Thing'
        @correspondence_address_3 = 'London'
        @correspondence_postcode = 'SE1'
        @lessee_short_name = 'Poopy'
        @property_address = '3 Other st'
        @arrears_letter_1_date = '12/02/2014'
        @total_collectable_arrears_balance = '£340'
      end
    end
  end
end

