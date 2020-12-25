class WorkspacesController < ApplicationController
    helper_method :sort_column, :sort_direction
    before_action :set_workspace, only: [:show, :edit, :update, :destroy, :move]

    def move
        @workspace.insert_at(params[:position].to_i)
    end

    def index
      @workspaces = Workspace.all
      #@workspaces = Workspace.order(sort_column + " " + sort_direction)
    end

    def show
        @workspace = Workspace.find(params[:id])
    end

    def next
        @workspace = Workspace.find(params[:workspace_id])
        if @workspace == Workspace.order(:position).last
            flash[:alert] = "This is the last workspace!"
            redirect_to @workspace
        else
            redirect_to @workspace.next
        end
    end

    def previous
        @workspace = Workspace.find(params[:workspace_id])
        if @workspace == Workspace.all.order(:position).first
            flash[:alert] = "This is the first workspace!"
            redirect_to @workspace
        else
            redirect_to @workspace.previous
        end
    end
    
    def new
        @workspace = Workspace.new
        respond_to do |format|
            format.html
            format.js
        end
    end

    def edit
        @workspace = Workspace.find(params[:id])
        respond_to do |format|
            format.html
            format.js
        end
    end

    def create
        @workspace = Workspace.new(workspace_params)
        if Workspace.count == 0
            @workspace.position = 1
        else
            @workspace.position = Workspace.all.order(:position).last.position + 1
        end
        @workspace.save
        redirect_to @workspace
    end

    def update
        @workspace = Workspace.find(params[:id])

        if allow_to_update (@workspace.assign_attributes(workspace_params))
            @workspace.update(workspace_params)
            flash[:notice] = "Workspace successfully updated!"
            redirect_to @workspace
        else
            flash[:alert] = "The number of items exceeds the maximum workspace capacity!"
            redirect_to @workspace
        end
    end

    def allow_to_update (workspace)
        num_items = 0
        @item = @workspace.items.all

        @workspace.items.each do |item|
            num_items = num_items + item.quantity
        end

        if (num_items > @workspace.max.to_i)
            return false
        else
            return true
        end
    end

    def destroy
        @workspace = Workspace.find(params[:id])
        @workspace.destroy
        redirect_to workspaces_path
    end

    private
        def set_workspace
            @workspace = Workspace.find(params[:id])
        end

        def workspace_params
            params.require(:workspace).permit(:name, :max, :details, :position)
        end
        
        def sort_column
            Workspace.column_names.include?(params[:sort]) ? params[:sort] : "name"
        end
        
        def sort_direction
            %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
        end
end
