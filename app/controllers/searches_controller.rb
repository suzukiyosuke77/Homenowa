class SearchesController < ApplicationController
  before_action :authenticate_user!

  #def search_result
    #@users = User.all
  #end

  def search
    @range = params[:range]
    @word = params[:word]
    @posts = []
    @users = []

    if @range == "会員"
      @users = User.looks(params[:search], params[:word])
    elsif @range == "投稿"
      @posts = Post.looks(params[:search], params[:word])
    end

    render :search_result
  end
end