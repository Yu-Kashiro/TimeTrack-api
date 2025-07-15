require 'rails_helper'

describe 'DeviseTokenAuth API認証テスト', type: :request do
  let(:user) { create(:user) }

  describe 'ユーザー新規登録' do
    it 'パラメータが揃っていれば、新規登録ができる、トークンが返ってくる' do
      post '/auth', params: {
        email: 'newuser@example.com',
        password: 'password123',
        name: '新しいユーザー'
      }.to_json, headers: {
        'CONTENT_TYPE' => 'application/json',
        'ACCEPT' => 'application/json'
      }

      expect(response).to have_http_status(:success)
      expect(response.headers['access-token']).to be_present
    end

    it 'パラメータ（ex.パスワード）が不足していると、登録に失敗する' do
      post '/auth', params: {
        email: 'newuser@example.com',
        name: '新しいユーザー'
      }.to_json, headers: {
        'CONTENT_TYPE' => 'application/json',
        'ACCEPT' => 'application/json'
      }

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  # describe 'User Login' do
  #   it 'allows user login with valid credentials' do
  #     post '/auth/sign_in', params: {
  #       email: user.email,
  #       password: 'password123'
  #     }.to_json, headers: {
  #       'CONTENT_TYPE' => 'application/json',
  #       'ACCEPT' => 'application/json'
  #     }

  #     expect(response).to have_http_status(:success)
  #     expect(response.headers['access-token']).to be_present
  #     expect(response.headers['client']).to be_present
  #     expect(response.headers['uid']).to eq(user.email)
  #   end

  #   it 'rejects login with invalid credentials' do
  #     post '/auth/sign_in', params: {
  #       email: user.email,
  #       password: 'wrongpassword'
  #     }.to_json, headers: {
  #       'CONTENT_TYPE' => 'application/json',
  #       'ACCEPT' => 'application/json'
  #     }

  #     expect(response).to have_http_status(:unauthorized)
  #   end
  # end

  # describe 'Guest User Login' do
  #   it 'creates a guest user and returns auth tokens' do
  #     post '/auth/guest_user', headers: {
  #       'CONTENT_TYPE' => 'application/json',
  #       'ACCEPT' => 'application/json'
  #     }

  #     expect(response).to have_http_status(:success)
  #     expect(response.headers['access-token']).to be_present
  #     expect(response.headers['client']).to be_present
  #     expect(response.headers['uid']).to match(/guest_.*@example\.com/)
  #   end
  # end

  # describe 'Protected Routes' do
  #   it 'allows access with valid auth headers' do
  #     auth_headers = login_user(user)

  #     get '/work_times', headers: auth_headers
  #     expect(response).to have_http_status(:success)
  #   end

  #   it 'denies access without auth headers' do
  #     get '/work_times'
  #     expect(response).to have_http_status(:unauthorized)
  #   end

  #   it 'denies access with invalid token' do
  #     get '/work_times', headers: {
  #       'access-token' => 'invalid_token',
  #       'client' => 'invalid_client',
  #       'uid' => user.email
  #     }
  #     expect(response).to have_http_status(:unauthorized)
  #   end
  # end

  # describe 'Login Status Check' do
  #   it 'returns login status for authenticated user' do
  #     auth_headers = login_user(user)

  #     get '/auth/login_status', headers: auth_headers
  #     expect(response).to have_http_status(:success)
  #     expect(JSON.parse(response.body)['is_login']).to be true
  #   end

  #   it 'returns not logged in for unauthenticated user' do
  #     get '/auth/login_status'
  #     expect(response).to have_http_status(:success)
  #     expect(JSON.parse(response.body)['is_login']).to be false
  #   end
  # end
end
