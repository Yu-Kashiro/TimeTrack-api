class Auth::CustomSessionsController < DeviseTokenAuth::SessionsController
  wrap_parameters false
end
