require_relative 'generate_pdf'
require_relative 'pdf_gateway'
require 'breezy_pdf'
require_relative 'config/initializers/breezy_pdf'

module Hackney
  module ServiceCharge
    class UseCaseFactory
      def generate_stage_1_pdf_use_case
        Hackney::ServiceCharge::Generate_pdf.new(
            template_path: 'lib/views/arrears_letter_stage_1.erb',
            style_path: 'lib/public/styles.css',
            pdf_gateway: pdf_use_case
        )
      end

      def generate_stage_2_pdf_use_case
        Hackney::ServiceCharge::Generate_pdf.new(
            template_path: 'lib/views/arrears_letter_stage_2.erb',
            style_path: 'lib/public/styles.css',
            pdf_gateway: pdf_use_case
        )
      end

      def pdf_use_case
        Hackney::ServiceCharge::PDF_gateway.new(
            breezy_pdf_gateway: BreezyPDF::HTML2PDF,
            asset_host: 'http://localhost:4567'
        )
      end
    end
  end
end
