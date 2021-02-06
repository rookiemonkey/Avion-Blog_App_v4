class ArticlesController < ApplicationController

    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def edit
    end

    def new
    end

    def show
    end

    def index
        self.set_articles params[:page]

        is_more_than_total_page = @articles.current_page > @articles.total_pages 
        self.set_articles 1 if is_more_than_total_page
        raise "You've reached the last page" if is_more_than_total_page
    end

    def create
        @article = Article.new(self.extract_article_params)
        raise 'Oh snap! Something went wrong upon creating your article' unless @article.save
        redirect_to @article, notice: 'Successfully created your article!'
    end

    def update
        raise 'Oh snap! Something went wrong upon updating your article' unless @article.update(self.extract_article_params)
        redirect_to @article, notice: "Successfully updated your article!"
    end

    def destroy
        raise 'Oh snap! Something went wrong upon deleting your article' unless @article.destroy
        redirect_to articles_path, notice: 'Successfully deleted your article!'
    end



    private

    def set_article
        @article = Article.find params[:id]
    end

    def set_articles(page)
        @articles = Article
          .paginate(page: page, per_page: 10)
          .order(created_at: :desc)
    end

    def extract_article_params
        params.require(:article).permit(:title, :body, :image, :image_cache)
    end

end
