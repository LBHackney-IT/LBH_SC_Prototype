require_relative 'generate_pdf'

module Hackney
  module ServiceCharge
    class UseCaseFactory
      def generate_stage_1_pdf_use_case
        Hackney::ServiceCharge::Generate_pdf.new(
            template_path: 'lib/views/arrears_letter_stage_1.erb',
            style_path: 'lib/public/styles.css'
        )
      end

      def generate_stage_2_pdf_use_case
        Hackney::ServiceCharge::Generate_pdf.new(
            template_path: 'lib/views/arrears_letter_stage_2.erb',
            style_path: 'lib/public/styles.css'
        )
      end
    end
  end
end
