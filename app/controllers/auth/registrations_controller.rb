class Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  private

  # 標準のメソッドは以下のとおり
  # https://github.com/lynndylanhurley/devise_token_auth/blob/master/app/controllers/devise_token_auth/registrations_controller.rb

  # 標準のDeviseTokenAuthには、:name パラメータが存在しないため、sign_up_paramsを上書き。
  def sign_up_params
    params.permit(:email, :password, :password_confirmation, :name)
  end
end
