class NodesController < ApplicationController
    # before_action :authenticate_user!
  def create
    params[:node].each do |n|
      Route.find(params[:route_id]).nodes.create(lat: n["lat"], lng: n["lng"])
    end
    head 201
 end
end
