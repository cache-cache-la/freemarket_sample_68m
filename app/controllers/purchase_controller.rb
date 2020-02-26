class PurchaseController < ApplicationController

  require 'payjp'

  def index
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
    @address = Address.where(user_id: current_user.id)
    @item = Item.where(user_id: current_user.id)
    @image = Image.where(user_id: current_user.id)
  end

  def pay
    card = Card.where(user_id: current_user.id).first
    item = Item.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
      amount: 20000,
      customer: card.customer_id,
      currency: 'jpy',
    )
    redirect_to root_path
  end

end
