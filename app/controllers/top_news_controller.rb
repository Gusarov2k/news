class TopNewsController < ApplicationController
  before_action :find_news, only: %i[show edit update destroy]
  before_action :require_login, only: %i[new create edit update destroy]

  def index
    @all_news = TopNews.all.order('created DESC')
  end

  def show; end

  def new
    @news = TopNews.new
  end

  def edit; end

  def create
    @news = TopNews.new(top_news_params)

    if @news.save
      redirect_to @news
    else
      render :new
    end
  end

  def update
    if @news.update(top_news_params)
      redirect_to @news
    else
      render :edit
    end
  end

  def destroy
    @news.destroy
    redirect_to top_news_index_path
  end

  private

  def find_news
    @news = TopNews.find(params[:id])
  end

  def top_news_params
    params.require(:top_news).permit(:title, :announcement, :context)
  end
end
