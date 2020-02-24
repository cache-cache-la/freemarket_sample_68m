class CardController < ApplicationController
  before_action :set_card, only: [:new, :delete, :show]
  before_action :call_api, only: [:pay, :delete, :show]

  require "payjp"

  def new
    redirect_to action: "show" if card.exists?
  end

  def pay 
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      description: "登録テスト",
      email: current_user.email,
      card: params["payjp-token"],
      metadata: {user_id: current_user}
      )
      @card = Card.new(user_id: current_user, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete
    if card.blank?
      redirect_to action: "new"
    end
    customer = Payjp::Customer.retrieve(card.customer_id)
    customer.delete
    card.delete
  end

  def show 
    customer = Payjp::Customer.retrieve(card.customer_id)
    @default_card_information = customer.cards.retrieve(card.card_id)
  end

  def set_card
    card = Card.where(user_id: current_user)
  end

  def call_api
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
  end
end