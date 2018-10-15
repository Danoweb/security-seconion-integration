class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder

  respond_to :csv, :json, :xls, :xml

  before_filter :set_access_control_headers

  ######

  def create
    @resource ||= model.create params_accessible
    @success ||= @resource.persisted?
    respond_with @resource, :attributes => attr_accessible, :success => @success
  end

  def destroy
    @resource ||= model.where(id_column => params[:id])
    @success ||= !@resource.destroy_all.empty?
    respond_with @success, :success => :resource
  end

  def index
    @order ||= 'updated_at desc'
    params[:q] = {:s => @order}.merge(params[:q] || {}) if !params[:q] or !params[:q][:s]
    @search ||= model.search(params[:q])
    if @search
      @resources ||= @search.result.page(params[:page])
      @total ||= @search.result.count
    end
    respond_with @resources, :total => @total, :page => params[:page], :attributes => attr_accessible
  end

  def show
    @resource = model.find_by(id_column => params[:id])
    respond_with @resource, :attributes => attr_accessible
  end

  def update
    @resource ||= model.find_by(id_column => params[:id])
    @success = @resource.update_attributes params_accessible
    respond_with @resource, :attributes => attr_accessible, :success => @success
  end

  ######

  def id_column
    :id
  end
  
  def model
  end

  def attr_accessible
  end
  
  def params_accessible
  end

  ######

  private

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = '*'
  end
end
