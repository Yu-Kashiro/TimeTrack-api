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

  describe 'ユーザーログイン' do
    it 'パラメータが揃っていれば、ログインできる' do
      post '/auth/sign_in', params: {
        email: user.email,
        password: user.password
      }.to_json, headers: {
        'CONTENT_TYPE' => 'application/json',
        'ACCEPT' => 'application/json'
      }

      expect(response).to have_http_status(:success)
      expect(response.headers['access-token']).to be_present
      expect(response.headers['client']).to be_present
      expect(response.headers['uid']).to eq(user.email)
    end

    it '間違ったパスワードだと、ログインに失敗する' do
      post '/auth/sign_in', params: {
        email: user.email,
        password: 'sippaiyoupassword'
      }.to_json, headers: {
        'CONTENT_TYPE' => 'application/json',
        'ACCEPT' => 'application/json'
      }

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'ゲストユーザーログイン' do
    it 'ゲストユーザーでログインすると、成功してトークン等が返ってくる' do
      post '/auth/guest_user', headers: {
        'CONTENT_TYPE' => 'application/json',
        'ACCEPT' => 'application/json'
      }

      expect(response).to have_http_status(:success)
      expect(response.headers['access-token']).to be_present
      expect(response.headers['client']).to be_present
      expect(response.headers['uid']).to be_present
    end
  end


  describe 'ログインステータスチェック' do
    it 'ログイン中の場合、is_login:trueになる' do
      auth_headers = login_user(user)

      get '/auth/login_status', headers: auth_headers
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['is_login']).to be true
    end

    it 'ログアウト中の場合、is_login:falseになる' do
      get '/auth/login_status'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['is_login']).to be false
    end
  end
end
