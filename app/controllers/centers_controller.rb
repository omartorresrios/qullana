class CentersController < ApplicationController

  def all_centers
  	centers = Center.all
  	render json: centers, status: 200
  end

end