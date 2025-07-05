class Auth::CustomSessionsController < DeviseTokenAuth::SessionsController
  # パラメータがラップされてしまうため、無効化。
  wrap_parameters false
end
