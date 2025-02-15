class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :set_parties, only: [:show]

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.id != nil
      redirect_to dashboard_path
      session[:user_id] = user.id
    else
      redirect_to register_path
      flash[:alert] = "#{user.errors.full_messages.to_sentence}"
    end
  end

  def show;end

  def login_form;end

  def login_user
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      redirect_to dashboard_path
      session[:user_id] = user.id
    else
      flash[:error]="Wrong password"
      render :login_form
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def set_user
      @user = current_user
    end

    def set_parties
      @parties = @user.parties
    end
end
