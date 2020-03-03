require 'rails_helper'
# require 'factories/purchase.rb'

RSpec.describe PurchaseController, type: :controller do

  describe 'GET#index' do
    let(:address) { create(:address) }
    let(:card) { create(:card) }
    let(:user) { create(:user) }
    let(:item) { create(:item) }
    it '遷移先のテスト' do
      binding.pry
      purchase = create(:purchase)
      get :index, params: { id: purchase.item_id }
      expect(response).to render_template :index
    end
  end

  describe 'POST#pay' do
    it 'Purchaseテーブルに保存' do
      post :pay,
      purchase = Purchase.create(address_id: address.id, card_id: card.id, user_id: user.id, item_id: item.id)
      expect(purchase.create).to change(Purchase, :count).by(1)
    end
  end
end