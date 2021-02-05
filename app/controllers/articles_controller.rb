class ArticlesController < ApplicationController

    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def edit
    end

    def new
    end

    def show
    end

    def index
        @articles = Article.paginate(page: params[:page], per_page: 10)
    end

    def create
        begin
            @article = Article.new(self.extract_article_params)
            raise 'Oh snap! Something went wrong upon creating your article' unless @article.save
            flash[:notice] = 'Successfully created your article!'
            redirect_to @article

        rescue StandardError => e
            flash.now[:alert] = e.message
            render :new

        end
    end

    def update
        begin
            raise 'Oh snap! Something went wrong upon updating your article' unless @article.update(self.extract_article_params)
            flash[:notice] = 'Successfully updated your article!'
            redirect_to @article
            
        rescue StandardError => e
            flash.now[:alert] = e.message
            render :edit
            
        end
    end

    def destroy
        begin
            raise 'Oh snap! Something went wrong upon deleting your article' unless @article.destroy
            flash[:notice] = 'Successfully deleted your article!'
            redirect_to articles_path

        rescue StandardError => e
            flash.now[:alert] = e.message
            render @article
        
        end
    end


    private

    def set_article
        begin
          @article = Article.find params[:id]

        rescue StandardError => e
            flash[:alert] = e.message
            redirect_to articles_path

        end
    end

    def extract_article_params
        params.require(:article).permit(:title, :body, :image, :image_cache)
    end

end
