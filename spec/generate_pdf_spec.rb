require_relative 'spec_helper'

require_relative '../lib/generate_pdf'
require_relative '../lib/pdf_gateway'

describe Hackney::ServiceCharge::Generate_pdf do
  let(:pdf_gateway) { instance_double(Hackney::ServiceCharge::PDF_gateway) }

  let(:payment_ref) { '123123123' }
  let(:lessee_full_name) { 'Mr Poopy Butthole' }
  let(:correspondence_address_1) { '1 Some st' }
  let(:correspondence_address_2) { 'Thing' }
  let(:correspondence_address_3) { 'London' }
  let(:correspondence_postcode) { 'SE1' }
  let(:lessee_short_name) { 'Poopy' }
  let(:property_address) { '3 Other st' }
  let(:arrears_letter_1_date) { '12/02/2014' }
  let(:total_collectable_arrears_balance) { '£340' }

  subject do  described_class.new(
      template_path: 'spec/examples/pdf_template.erb',
      style_path: 'spec/examples/style.css',
      pdf_gateway: pdf_gateway
  )
  end

  let(:translated_html) do
    "<h1>Test PDF</h1>\n<p>\n  date = #{Time.now.strftime("%d/%m/%Y")}\n  payment_ref = 123123123\n  lessee_full_name = Mr Poopy Butthole\n  correspondence_address_1 = 1 Some st\n  correspondence_address_2 = Thing\n  correspondence_address_3 = London\n  correspondence_postcode = SE1\n  lessee_short_name = Poopy\n  property_address = 3 Other st\n  arrears_letter_1_date = 12/02/2014\n  total_collectable_arrears_balance = £340\n</p>"
  end

  it 'should pass the required translated html through to the gateway' do
    expect(pdf_gateway).to receive(:generate_pdf)
                               .with(translated_html)
                               .and_return('pdf_url')
    subject.execute(
        payment_ref: payment_ref,
        lessee_full_name: lessee_full_name,
        correspondence_address_1: correspondence_address_1,
        correspondence_address_2: correspondence_address_2,
        correspondence_address_3: correspondence_address_3,
        correspondence_postcode: correspondence_postcode,
        lessee_short_name: lessee_short_name,
        property_address: property_address,
        arrears_letter_1_date: arrears_letter_1_date,
        total_collectable_arrears_balance: total_collectable_arrears_balance
    )
  end

end
