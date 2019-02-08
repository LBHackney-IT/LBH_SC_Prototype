# frozen_string_literal: true

require 'bundler'
Bundler.require
require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  'Hello World'
end