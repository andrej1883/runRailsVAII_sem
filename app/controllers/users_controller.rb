class UsersController < ApplicationController
  before_action :authenticate_user!
  authorize_resource :user #pre funkcnost cancancan

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path, notice: "User was successfully updated."
    else
      redirect_to edit_user_path, notice: "User must have at least 1 role!"
    end
  end

  def index
    @users = User.order(created_at: :desc)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: "User was successfully destroyed." }
      format.json { head :no_content }
      format.js
    end
  end

  private
  def user_params
    params.require(:user).permit({role_ids: []})
  end
end
