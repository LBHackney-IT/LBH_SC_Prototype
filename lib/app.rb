# frozen_string_literal: true
require 'sinatra'
require 'sinatra/reloader' if development?
require_relative 'use_case_factory'
require 'byebug'

use BreezyPDF::Middleware
set :public_folder, File.dirname(__FILE__) + '/public'

def use_cases
  @use_cases ||= Hackney::ServiceCharge::UseCaseFactory.new
end

get '/' do
  erb :form, layout: :layout
end

post '/letters' do
  @stage_1 = use_cases.generate_stage_1_pdf_use_case.execute(
      payment_ref: params[:payment_ref],
      lessee_full_name: params[:lessee_full_name],
      correspondence_address_1: params[:correspondence_address_1],
      correspondence_address_2: params[:correspondence_address_2],
      correspondence_address_3: params[:correspondence_address_3],
      correspondence_postcode: params[:correspondence_postcode],
      lessee_short_name: params[:lessee_short_name],
      property_address: params[:property_address],
      arrears_letter_1_date: params[:arrears_letter_1_date],
      total_collectable_arrears_balance: params[:total_collectable_arrears_balance]
  )
  @stage_2 = use_cases.generate_stage_2_pdf_use_case.execute(
      payment_ref: params[:payment_ref],
      lessee_full_name: params[:lessee_full_name],
      correspondence_address_1: params[:correspondence_address_1],
      correspondence_address_2: params[:correspondence_address_2],
      correspondence_address_3: params[:correspondence_address_3],
      correspondence_postcode: params[:correspondence_postcode],
      lessee_short_name: params[:lessee_short_name],
      property_address: params[:property_address],
      arrears_letter_1_date: params[:arrears_letter_1_date],
      total_collectable_arrears_balance: params[:total_collectable_arrears_balance]
  )
  erb :index, layout: :layout
end