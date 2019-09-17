class ResourcesController < ApplicationController
  # calls the following methods before going through the methods defined after "only"
  before_action :set_resource, only: [:edit, :update, :destroy]

  # GET /resources/index
  def index
    @resources = Resource.all
  end

  # GET /resources/new
  def new
    @resource = Resource.new
  end

  # POST /resources/create
  def create
    @resource = Resource.new(resource_params)

    respond_to do |format|
      if @resource.save
        format.html { redirect_to resources_url, status: :see_other, notice: 'Resource was successfully created.'}
        format.json { render :index, status: :created, location: resources_url }
      else
        format.html { redirect_to :new}
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end

  end

  # GET /resources/1/edit
  def edit
  end

  # PATCH/PUT /resources/1
  # PATCH/PUT /resources/1.json
  def update
    respond_to do |format|
      if @resource.update(resource_params)
        format.html { redirect_to resources_url, status: :see_other, notice: 'Resource was successfully updated.'}
        format.json { render :index, status: :ok, location: resources_url}
      else
        format.html { render :edit}
        format.json { render json:@resource.errors, status: :unprocessable_entity}
      end
    end
  end

  #DELETE /resources/1
  def destroy
    respond_to do |format|
      if @resource.destroy
        format.html { redirect_to resources_url, status: :see_other, notice: 'Resource was successfully removed.'}
        format.json { render :index, status: :ok, location: resources_url}
      else
        format.html { render :index}
        format.json { render json:@resource.errors, status: :unprocessable_entity}
      end
    end
  end

  # used to set resource with id from parameters
  private
  def set_resource
    @resource = Resource.find(params[:id])
  end

  def resource_params
    params.require(:resource).permit(:name, :author, :ref, :category, :rating, :tag)
  end
end
