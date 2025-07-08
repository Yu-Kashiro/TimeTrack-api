class Auth::GuestUsersController < DeviseTokenAuth::RegistrationsController
  def create
    guest_email = "guest_#{SecureRandom.uuid}@example.com"
    guest_password = SecureRandom.urlsafe_base64

    params[:email] = guest_email
    params[:password] = guest_password
    params[:password_confirmation] = guest_password
    params[:name] = "ゲストユーザー"

    # 親クラスのcreateメソッド呼び出し
    super
  end

  # 親クラスのsign_up_paramsは継承できず、独自に定義したparamsを使用（controllerで作成したparamsは許可されない）
  # https://github.com/lynndylanhurley/devise_token_auth/blob/master/app/controllers/devise_token_auth/application_controller.rb#L37
  # https://github.com/lynndylanhurley/devise_token_auth/blob/master/app/controllers/devise_token_auth/registrations_controller.rb#L10
  private
  def sign_up_params
    {
      email: params[:email],
      password: params[:password],
      name: params[:name]
    }
  end
end
