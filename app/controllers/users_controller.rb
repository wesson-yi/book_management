class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @records = @user.library_records.includes(:book)
  end

  def create
    @user = User.create!(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:name, :age, :gender, :ID_number, :mobile, :email, :balance, :password, :password_confirmation)
  end
end
