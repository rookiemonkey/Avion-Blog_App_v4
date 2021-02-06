class ApplicationController < ActionController::Base

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from RuntimeError, with: :custom_error

  protected

  def record_not_found(exception)
      flash[:alert] = "Unable to find what you are looking for"
      redirect_to articles_path
  end

  def custom_error(exception)
      flash.now[:alert] = exception.message
      return render "articles/new" if handler == 'articles#create'
      return render "articles/edit" if handler == 'articles#update'
      render "articles/index"
  end

  
  private

  def handler
    "#{params[:controller]}##{params[:action]}"
  end

end
