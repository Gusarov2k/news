class TopNewsController < ApplicationController
  before_action :find_news, only: %i[show edit update destroy]
  before_action :require_login, only: %i[new create edit update destroy]

  respond_to :html

  def index
    respond_with(@all_news = TopNews.all.order('created DESC'))
  end

  def show
    respond_with(@news)
  end

  def new
    respond_with(@news = TopNews.new)
  end

  def edit; end

  def create
    respond_with(@news = TopNews.new(top_news_params))
  end

  def update
    @news.update(top_news_params)
    respond_with(@news)
  end

  def destroy
    respond_with(@news.destroy)
  end

  private

  def find_news
    @news = TopNews.find(params[:id])
  end

  def top_news_params
    params.require(:top_news).permit(:title, :announcement, :context)
  end
end
