class ItemsController < ApplicationController
    helper_method :sort_column, :sort_direction

    def index
        @items = Item.order(sort_column + " " + sort_direction).where(finish: true)
        respond_to do |format|
            format.xlsx {response.headers['Content-Disposition'] = "attachment; filename = Items.xlsx"}
            format.html { render :index }
        end
    end

    def index_all
        @items = Item.all.order(sort_column + " " + sort_direction)
    end

    def index_current
        @items = Item.order(sort_column + " " + sort_direction).where(finish: false)
    end

    def new
        @workspace = Workspace.find(params[:workspace_id])
        @item = @workspace.items.new
        respond_to do |format|
            format.html
            format.js
        end
        @item.dues.build
    end

    def show
        @workspace = Workspace.find(params[:workspace_id])
        @item = @workspace.items.find(params[:id])

        @qrcode = RQRCode::QRCode.new(workspace_item_path)
        
        @svg = @qrcode.as_svg(
            offset: 0,
            color: '000',
            sharp_rendering: 'crispEdges',
            module_size: 6
        )
        
        require 'barby'
        require 'barby/barcode'
        require 'barby/barcode/qr_code'
        require 'barby/outputter/png_outputter'
      
        barcode = Barby::QrCode.new(workspace_item_path, level: :q, size: 5)
        @base64_output = Base64.encode64(barcode.to_png({ xdim: 5 }))
    end


    def create
        @workspace = Workspace.find(params[:workspace_id])
        @item = @workspace.items.new(item_params)
        
        #if the quantity does not exceeds the max capacity
        if @item.quantity + number_of_items(@workspace) <= @workspace.max.to_i
            @item.create(item_params)
            flash[:notice] = "Item successfully created!"
            redirect_to workspace_path(@workspace)
        else
            flash[:alert] = "The number of items exceeds the maximum workspace capacity!"
            redirect_to workspace_path(@workspace)
        end
    end

    def number_of_items(workspace)
        num_items = 0
        @workspace = Workspace.find(params[:workspace_id])
        @item = @workspace.items.all

        #calculates the number of items in each workspace
        @workspace.items.each do |item|
            num_items += item.quantity
        end
        
        #returns the number of items in a workspace
        return num_items
    end


    def next
        @workspace = Workspace.find(params[:workspace_id])
        @item = @workspace.items.find(params[:item_id])

        #checks whether the workspace is the last workspace or not
        if @workspace == Workspace.order(:position).last
            #flashes a notice when the item is finished
            @item.update_attribute(:finish, true)
            flash[:notice] = "Item #{@item.name} is finished!"
            redirect_to workspace_path(@workspace)

        else
            #.next is defined in model workspace.rb
            @nextworkspace = @workspace.next

            #count the number of items in the nextworkspace
            num_items = 0
            @nextworkspace.items.each do |item|
                num_items += item.quantity
            end

            #if the quantity does not exceeds the max capacity
            if @item.quantity + num_items < @nextworkspace.max.to_i
                @item.update_attribute(:workspace_id, @nextworkspace.id)
                flash[:notice] = "This is #{@nextworkspace.name} workspace"
                redirect_to workspace_path(@nextworkspace)
            else
                flash[:alert] = "Exceeds the capacity of #{@nextworkspace.name} workspace"
                redirect_to workspace_path(@workspace)
            end

        end
    end

    def previous
        @workspace = Workspace.find(params[:workspace_id])
        @item = @workspace.items.find(params[:item_id])

        #checks whether the workspace is the first workspace or not
        if @workspace == Workspace.order(:position).first
            flash[:alert] = "This is the first workspace!"
            redirect_to workspace_path(@workspace)

        else
            #.previous is defined in model workspace.rb
            @prevworkspace = @workspace.previous

            #count the number of items in the nextworkspace
            num_items = 0
            @prevworkspace.items.each do |item|
                num_items += item.quantity
            end

            #if the quantity does not exceeds the max capacity
            if @item.quantity + num_items <= @prevworkspace.max.to_i
                @item.update_attribute(:workspace_id, @prevworkspace.id)
                flash[:notice] = "This is #{@prevworkspace.name} workspace"
                redirect_to workspace_path(@prevworkspace)
            else
                flash[:alert] = "Exceeds the capacity of #{@prevworkspace.name} workspace"
                redirect_to workspace_path(@workspace)
            end

        end
    end

    def edit
        @workspace = Workspace.find(params[:workspace_id])
        @item = @workspace.items.find(params[:id])
        respond_to do |format|
            format.html
            format.js
        end
    end

    def update
        @workspace = Workspace.find(params[:workspace_id])
        @item = @workspace.items.find(params[:id])
        
        @item.update(item_params)
        redirect_to workspace_path(@workspace)
    end 

    def destroy
        @workspace = Workspace.find(params[:workspace_id])
        @item = @workspace.items.find(params[:id])
        @item.destroy
        redirect_to workspace_path(@workspace)
    end
            
    private
        def item_params
            params.require(:item).permit(:name, :owner, :quantity, :details, :picture, :dues_attributes => [:id, :name, :duedate])
        end

        def sort_column
            Item.column_names.include?(params[:sort]) ? params[:sort] : "name"
        end
        
        def sort_direction
            %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
        end


end
