class MainController < ApplicationController
  def index
  	flash.now[:notice] = "Signed in succesfully"
  	flash.now[:alert] = "Wrong Username or Password"
  end
end
