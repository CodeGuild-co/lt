class HomeController < ApplicationController
  def index
	render :locals => { :loud => true }
  end
end
