class ActionController::FirstFloor < ActionController::Base
  def index
    obj_class = controller_name.to_s.singularize.titleize
    view_obj  = controller_name.to_s
    eval( "@#{view_obj} = obj_class.constantize.find(:all)" )
    render_response( eval( "@#{view_obj}" ), 'index' )
  end

  def show
    obj_class = controller_name.to_s.singularize.titleize
    view_obj  = controller_name.to_s.singularize
    eval( "@#{view_obj} = obj_class.constantize.find(params[:id])" )
    render_response( eval( "@#{view_obj}" ) , 'show' )
  end

  def new
    obj_class = controller_name.to_s.singularize.titleize
    view_obj  = controller_name.to_s.singularize
    eval( "@#{view_obj} = obj_class.constantize.new" )
  end

  def create
    obj_class = controller_name.to_s.singularize.titleize
    obj_name  = controller_name.to_s.singularize
    @obj = obj_class.constantize.new(params[obj_name.to_sym])
    if @obj.save
      flash[:notice] = "#{obj_class} was successfully created"
      flash[:status] = 201
      redirect_to :action => :index
    else
      eval( "@#{obj_name} = @obj" )

      flash[:notice] = "Cannot create this #{obj_class}. There were some errors."
      flash[:status] = 400
      render_response( eval( "@#{obj_name}" ), 'new', 400 )
    end
  end

  def edit
    obj_class = controller_name.to_s.singularize.titleize
    view_obj  = controller_name.to_s.singularize

    eval( "@#{view_obj} = obj_class.constantize.find(params[:id])" )
  end

  def update
    obj_class = controller_name.to_s.singularize.titleize
    obj_name  = controller_name.to_s.singularize
    @obj      = obj_class.constantize.find(params[:id])

    if @obj.update_attributes( params[obj_name.to_sym] )
      check_validation(@obj)

      flash[:notice] = "#{obj_class} was successfully updated."
      flash[:status] = 200
      eval( "@#{obj_name} = @obj" )
      redirect_to :action => :show, :id => eval( "@#{obj_name}" )
    else
      eval( "@#{obj_name} = @obj" )

      flash[:notice] = "#{obj_class} had some errors and was not updated."
      flash[:status] = 400
      render_response( eval( "@#{obj_name}" ), 'edit', 400 )
    end
  end

  def destroy
    obj_class = controller_name.to_s.singularize.titleize
    obj       = obj_class.constantize.find(params[:id])
    obj_info  = nil

    if obj.respond_to?(:name)
      obj_info = "#{obj.id}:#{obj.name}"
    else
      obj_info = "#{obj.id}:#{obj.to_s}"
    end
    obj_class.constantize.delete(params[:id])
    flash[:notice] = "#{obj_class} '#{obj_info} successfully deleted.'"
    redirect_to :action => 'index'
  end

  def render_response(obj, tmpl, status = :ok)
    klass = nil
    if obj.class == Array
      klass = obj[0].class

      ## Make sure we're not dealing with a NilClass, which we don't have
      ## a template for. Default to the controller class.
      if klass == NilClass
        klass = controller_name.to_s.singularize.titleize
      end
    else
      klass = obj.class
    end

    namespace = klass.to_s.downcase.pluralize

    if /^Admin/.match( self.class.to_s )
      namespace = "admin/#{namespace}"
    end

    respond_to do |format|
      format.html { render :status => status }
      format.xml  { render :xml  => obj.to_xml,  :status => status }
      format.json { render :json => obj.to_json, :status => status }
      format.yaml { render :text => obj.to_yaml, :status => status }
    end
  end

  protected
  def check_validation(obj)
    unless obj.valid?
      raise ActiveRecord::ActiveRecordError, "This record is invalid."
    end
  end

end
