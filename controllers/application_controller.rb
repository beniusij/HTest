require 'sinatra'
require_relative '../models/story'

class ApplicationController < Sinatra::Base

  set :views, File.expand_path('../../views', __FILE__)

  enable :sessions
end