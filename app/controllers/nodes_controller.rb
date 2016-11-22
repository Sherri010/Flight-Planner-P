class NodesController < ApplicationController
    # before_action :authenticate

  def create

    params[:node].each do |n|
      Route.find(params[:route_id]).nodes.create(lat: n["lat"], long: n["long"])
    end
    head 201
 end
end
