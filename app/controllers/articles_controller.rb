class ArticlesController < ApplicationController

    before_action :set_article, only: [:show]

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
            raise 'Failed to save' unless @article.save
            redirect_to @article

        rescue Exception => e
            render :new

        end
    end


    private

    def set_article
        @article = Article.find params[:id]
    end

    def extract_article_params
        params.require(:article).permit(:title, :body)
    end

end
