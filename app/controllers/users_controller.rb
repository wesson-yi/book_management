# user: {
#   name: 'username',
#   age: 26,
#   gender: 'male',
#   ID_number: '411684199211103432',
#   mobile: '15136167907',
#   email: 'wesson.yi@gmail.com',
#   balance: 1_000
# }

class UsersController < ApplicationController
  def show; end

  def create
    @user = User.create!(user_params)
    render json: @user, status: :created
  end

  private

  def user_params
    params.require(:user).permit(:name, :age, :gender, :ID_number, :mobile, :email, :balance, :password)
  end
end
