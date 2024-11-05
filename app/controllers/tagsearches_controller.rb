class TagsearchesController < ApplicationController
  
  def search
    @model = Post  #search機能とは関係なし
    @word = params[:content]
    @s = Book.where("category LIKE?","%#{@word}%")
    render "tagsearches/tagsearch"
  end

end
