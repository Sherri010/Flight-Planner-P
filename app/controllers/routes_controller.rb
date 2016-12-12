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


  def get_file
    p "hiting right function"
    content = File.read(params[:gps_file].tempfile)
    p content
    # doc = YAML.load(content)
    render :json => {status:"ok"}, status: 200
  end

def process_gps_data
    dataset=[];
    f = File.open("./data.txt", "r")
    f.each_line do |line|
     line = line.split(';')
     first = line[0].split(' ')[1..4]
     first.push(line[1])
     dataset.push(first)
    end
    f.close
    coordinates = []

    dataset.each do |c|
      lat_deg = c[0]
      lat_deg = lat_deg[1..2].to_i
      lng_deg = c[2]
      lng_deg = lng_deg[2..3].to_i
      lat1 = c[1].to_f / 60 + lat_deg
      lng1 = c[3].to_f / 60 + lng_deg
      coordinates.push([lat1, lng1])
    end

    File.open("./cleandata_username.txt", 'w') { |file| file.write(dataset) }
    File.open("./coordinates_username.txt", 'w') { |file| file.write(coordinates) }

    render :json => coordinates, status: 200
end

private
  def route_params
    params.require(:route).permit(:name,:distance,:user_id)
  end

end
