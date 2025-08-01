require 'rails_helper'

describe 'WorkTimesコントローラー' do
  let!(:user) { create(:user) }
  let(:auth_headers) { login_user(user) }

  describe 'indexメソッドのテスト' do
    # 事前に出勤データを6日間分作成
    let!(:work_times) do
      [
        create(:work_time, user: user, work_date: Date.current - 31.days),
        create(:work_time, user: user, work_date: Date.current - 30.day),
        create(:work_time, user: user, work_date: Date.current - 15.day),
        create(:work_time, user: user, work_date: Date.current - 10.days),
        create(:work_time, user: user, work_date: Date.current - 1.day),
        create(:work_time, user: user, work_date: Date.current)
      ]
    end
    it 'ログイン済みユーザーだと、work_timesがレスポンスされる' do
      get '/work_times', headers: auth_headers

      expect(response).to have_http_status(:success)
      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq(6)
    end

    it 'ログインしていないと、データ取得に失敗する' do
      get '/work_times'

      expect(response).to have_http_status(:unauthorized)
    end
  end

  # describe '出勤データを登録する' do
  #   let(:work_time_params) do
  #     {
  #       work_time: {
  #         work_date: Date.current - 5.days,
  #         clock_in: "08:30",
  #         clock_out: "17:15",
  #         break_duration: "01:00",
  #         note: "通常勤務日でした。"
  #       }
  #     }
  #   end

  #   it 'ログイン済みのユーザーが出勤データを登録できる' do
  #     expect {
  #       post '/work_times', params: work_time_params.to_json, headers: auth_headers.merge({
  #         'CONTENT_TYPE' => 'application/json'
  #       })
  #     }.to change(WorkTime, :count).by(1)

  #     expect(response).to have_http_status(:created)
  #     json_response = JSON.parse(response.body)
  #     expect(json_response['user_id']).to eq(user.id)
  #     expect(json_response['work_minute']).to eq(465)
  #   end

  #   it 'ログインしていないユーザーは登録ができない' do
  #     post '/work_times', params: work_time_params.to_json, headers: {
  #       'CONTENT_TYPE' => 'application/json'
  #     }

  #     expect(response).to have_http_status(:unauthorized)
  #   end
  # end

  # describe "GET/work_times/update:id" do
  #   let(:work_time) { create(:work_time, user: user) }
  #   let(:work_time_params) do
  #     {
  #       work_time: {
  #         id: "9999999",
  #         work_date: Date.current - 5.days,
  #         clock_in: "08:30",
  #         clock_out: "17:15",
  #         break_duration: "01:00",
  #         note: "通常勤務日でした。"
  #       }
  #     }
  #   end
  #   it "ログインしているユーザーが、自分のデータをupdateできる" do
  #     put "/work_times/#{work_time.id}", params: work_time_params.to_json, headers: auth_headers.merge({
  #         'CONTENT_TYPE' => 'application/json'
  #       })

  #     # expect(json_response['user_id']).to eq(user.id)
  #     expect(json_response['work_minute']).to eq(465)
  #   end
  # end

  # describe 'GET /work_times/:id' do
  #   let(:work_time) { create(:work_time, user: user, work_date: Date.current - 3.days) }

  #   it 'returns specific work time for owner' do
  #     get "/work_times/#{work_time.id}", headers: auth_headers

  #     expect(response).to have_http_status(:success)
  #     json_response = JSON.parse(response.body)
  #     expect(json_response['id']).to eq(work_time.id)
  #   end

  #   it 'denies access to other users work time' do
  #     other_user = create(:user)
  #     other_work_time = create(:work_time, user: other_user, work_date: Date.current - 4.days)

  #     get "/work_times/#{other_work_time.id}", headers: auth_headers

  #     expect(response).to have_http_status(:not_found)
  #    end
  # end

  # describe '' do
  #   it 'updates work time for owner' do
  #     patch "/work_times/#{work_time.id}", params: update_params.to_json, headers: auth_headers.merge({
  #       'CONTENT_TYPE' => 'application/json'
  #     })

  #     expect(response).to have_http_status(:success)
  #     work_time.reload
  #     expect(work_time.work_minute).to eq(540) # 10 hours - 1 hour break = 9 hours = 540 minutes
  #   end

  #   it 'denies update to other users work time' do
  #     other_user = create(:user)
  #     other_work_time = create(:work_time, user: other_user, work_date: Date.current - 6.days)

  #     patch "/work_times/#{other_work_time.id}", params: update_params.to_json, headers: auth_headers.merge({
  #       'CONTENT_TYPE' => 'application/json'
  #     })

  #     expect(response).to have_http_status(:not_found)
  #   end
  # end

  # describe 'DELETE /work_times/:id' do
  #   let!(:work_time) { create(:work_time, user: user, work_date: Date.current - 7.days) }

  #   it 'deletes work time for owner' do
  #     expect {
  #       delete "/work_times/#{work_time.id}", headers: auth_headers
  #     }.to change(WorkTime, :count).by(-1)

  #     expect(response).to have_http_status(:no_content)
  #   end

  #   it 'denies deletion of other users work time' do
  #     other_user = create(:user)
  #     other_work_time = create(:work_time, user: other_user, work_date: Date.current - 8.days)

  #     delete "/work_times/#{other_work_time.id}", headers: auth_headers

  #     expect(response).to have_http_status(:not_found)
  #   end
  # end
end
