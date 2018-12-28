class HashtagsController < ApplicationController
  def show
    @tag = Hashtag.find(params[:id])
    @questions = @tag.questions
  end
end