class TemplatesController < ActionController::Base
  def index
    render file: "index"
  end

  def show
    render file: params[:path]
  end
end
