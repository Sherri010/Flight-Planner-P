class RoutesController < ApplicationController

  def index
     render :json => Route.all,status: 200
  end

  def show
    route = Route.find(params[:id])
    node = route.nodes
    result = {"routes": route, "nodes":node}
   if route
     render :json => result,status: 200
   else
     render :json => {error:"not found"},status: 400
   end
  end

  def create
    route= Route.create(route_params)
    if route
      render :json, route,status: 200
    else
      render :json, {error:"fails creating new node"}, status: 200
    end
  end

private
  def route_params
    params.require(:route).permite(:name,:distance,:user_id)
  end

end
