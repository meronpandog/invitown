class Public::UsersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(user_params)
      redirect_to users_my_page_path
    else
      render :edit
    end
  end

  def destroy
  end

 private

  def user_params
    params.require(:customer).permit(:name, :email, :profile_image)
  end

  def ensure_correct_customer
    @user = User.find(params[:id])
    unless @customer == current_customer
      redirect_to user_path(current_customer)
    end
  end
end
