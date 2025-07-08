class Auth::LoginStatusesController < ApplicationController
  def show
    if current_user
      render json: { is_login: true }
    else
      render json: { is_login: false, message: "ユーザーは存在しません" }
    end
  end
end
