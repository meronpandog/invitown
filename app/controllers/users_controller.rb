class UsersController < ApplicationController

 private

  def post_params
    params.permit(:image, :text)
  end
end
