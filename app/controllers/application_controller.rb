class ApplicationController < ActionController::Base

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from RuntimeError, with: :raised_errors

  protected

  def record_not_found(exception)
      redirect_to articles_path, alert: "Unable to find what you are looking for"
  end

  def raised_errors(exception)
      flash.now[:alert] = exception.message
      return render "articles/new" if handler == 'articles#create'
      return render "articles/edit" if handler == 'articles#update'
      return redirect_to(articles_path, alert: exception.message) if handler == 'articles#search'
      render "articles/index"
  end



  
  private

  def handler
    "#{params[:controller]}##{params[:action]}"
  end

end
