class Api::V1::ArticlesController < ApplicationController

  protect_from_forgery with: :null_session
  before_action :set_article, only: [:show, :update, :destroy]

  # GET/INDEX
  def index
    articles = Article.all
    render json: articles.map { |article| ArticlePresenter.new(article).as_json }
  end

  # GET/ SHOW
  def show
    render json: ArticlePresenter.new(@article).as_json
  end

  # POST 
  def create
    article = Article.new(article_params)
    if article.save
      render json: ArticlePresenter.new(article).as_json, status: :created
    else
      render json: article.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT/UPDATE
  def update
    if @article.update(article_params)
      render json: ArticlePresenter.new(@article).as_json
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # DELETE 
  def destroy
    @article.destroy
    head :no_content
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content, :author, :published_at, :image)
  end
end
