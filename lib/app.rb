# frozen_string_literal: true
require 'sinatra'
require 'sinatra/reloader' if development?
require_relative 'use_case_factory'
require 'byebug'
require 'breezy_pdf'
require_relative 'config/initializers/breezy_pdf'

use BreezyPDF::Middleware
set :public_folder, File.dirname(__FILE__) + '/public'

def use_cases
  @use_cases ||= Hackney::ServiceCharge::UseCaseFactory.new
end

get '/' do
  @stage_1 = use_cases.generate_stage_1_pdf_use_case.execute
  @stage_2 = use_cases.generate_stage_2_pdf_use_case.execute

  erb :index, layout: :layout
end