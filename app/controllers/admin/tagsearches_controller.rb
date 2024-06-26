class Admin::TagsearchesController < ApplicationController
  def search
    @model = Post  #search機能とは関係なし
    @word = params[:content]
    @posts = Post.where("category LIKE?","%#{@word}%")
    render "tagsearches/tagsearch"
  end
end
