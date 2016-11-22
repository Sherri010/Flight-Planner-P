class RoutesController < ApplicationController
    # before_action :authenticate

  def index
     render :json => Route.where(user_id:current_user.id).order(created_at: :desc),status: 200
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
    #  route = current_user.routes.create(:name => params[:name],:distance =>params[:distance])
      r = Route.create(route_params)
      if r.valid?
         render :json => r, status: 200
      else
         render :json => {error:'faild attempt',  p: params}, status: 400
      end
  end

   def destroy_all_nodes
      list = Route.find(params[:id]).nodes.delete_all
      unless list
        render :json => {success:"all nodes are deleted"}, status: 200
      else
        render :json => {error:"failed attempt"},status: 400
      end
   end

  def destroy
     r = Route.find(params[:id]).destroy
    if r
      render :json => {success:'successfully removed route'}, status: 200
      
    else
       render :json => {error:'faild attempt'}, status: 400
    end
  end

  def update
     d = Route.find(params[:id]).destroy
     c = Route.create(route_params)
     if c.valid? and d
       render :json => c, status: 200
    else
       render :json => {error:'faild attempt'}, status: 400
    end
  end

private
  def route_params
    params.require(:route).permit(:name,:distance,:user_id)
  end

end
