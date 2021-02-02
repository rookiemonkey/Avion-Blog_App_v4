class ArticlesController < ApplicationController

    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def edit
    end

    def new
    end

    def show
    end

    def index
        @articles = Article.all
    end

    def create
        begin
            @article = Article.new(self.extract_article_params)
            raise 'Failed to create article' unless @article.save
            redirect_to @article

        rescue => e
            render :new

        end
    end

    def update
        begin
            raise 'Failed to update article' unless @article.update(self.extract_article_params)
            redirect_to @article
            
        rescue => e
            render :edit
            
        end
    end

    def destroy
        begin
            raise 'Failed to delete article' unless @article.destroy
            redirect_to articles_path

        rescue => e
            render @article
        
        end
    end


    private

    def set_article
        @article = Article.find params[:id]
    end

    def extract_article_params
        params.require(:article).permit(:title, :body, :image)
    end

end
