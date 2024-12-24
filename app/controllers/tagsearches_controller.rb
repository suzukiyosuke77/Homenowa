class TagsearchesController < ApplicationController
  def search
    @word = params[:content]
    @posts = Post.tagged_with(@word, on: :categories)
    render "tagsearches/tagsearch"
  end
end