class NodesController < ApplicationController
    # before_action :authenticate_user!

  def create
    p "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
    p params
    params[:node].each do |n|
      Route.find(params[:route_id]).nodes.create(lat: n["lat"], long: n["lng"])
    end
    head 201
 end
end
