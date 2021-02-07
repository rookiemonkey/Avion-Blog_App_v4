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

        if self.is_last_page
          self.set_articles 1
          raise "You've reached the last page"
        end
    end

    def create
        @article = Article.new(self.extract_article_params)
        raise 'Oh snap! Something went wrong upon creating your article' unless @article.save
        redirect_to @article, notice: 'Successfully created your article!'
    end

    def update
        raise 'Oh snap! Something went wrong upon updating your article' unless @article.update(self.extract_article_params)

        # 'fix for heroku temp uploads'
        if (File.exist? @article.image.file.file) and (!@article.image.file.nil?)
          @article.image = nil
          @article.save
        end

        redirect_to @article, notice: "Successfully updated your article!"
    end

    def destroy
        raise 'Oh snap! Something went wrong upon deleting your article' unless @article.destroy
        redirect_to articles_path, notice: 'Successfully deleted your article!'
    end

    def search
        self.set_articles_search params[:page]
        
        if self.is_last_page
          self.set_articles_search 1
          raise "You've reached the last page"
        end

        raise "No results for your query" if @articles.length.zero?

        render 'index'
    end



    private

    def set_article
        return if params[:id] == 'search'
        @article = Article.find params[:id]
    end

    def set_articles(page)
        @articles = Article
          .paginate(page: page, per_page: 10)
          .order(created_at: :desc)
    end

    def set_articles_search(page)
        @articles = Article
          .paginate(page: page, per_page: 10)  
          .where("title LIKE ?", "%#{params[:query]}%")
          .order(created_at: :desc)
    end

    def extract_article_params
        params.require(:article).permit(:title, :body, :image, :image_cache)
    end

    def is_last_page
        @articles.current_page > @articles.total_pages 
    end

end
