require 'rails_helper'

RSpec.describe PurchaseController, type: :controller do
  xdescribe 'GET#index' do
    it '遷移先のテスト' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'POST#pay' do
    it 'Purchaseテーブルに保存' do
      post :pay
      purchase.create(address_id:1, card_id:2, user_id:3,)
      expect ()
    end
  end
end