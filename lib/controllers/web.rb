require_relative './application_controller.rb'

class Web < ApplicationController

  get '/' do 	
  	erb :index
  end

  get '/work_space/:search_name' do
    @title = "Work Space"
  	erb :"work_space"
  end
end