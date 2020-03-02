class CardController < ApplicationController
  before_action :set_parents

  require "payjp"
  before_action :set_card, only: [:delete, :show]
  before_action :call_api, only: [:pay, :delete, :show]

  def new
    card = Card.where(user_id: current_user.id)
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
      metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card,)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end

  def destroy
    card = Card.find_by(user_id: current_user.id)
    customer = Payjp::Customer.retrieve(card.customer_id)
    customer.delete
    card.delete
    redirect_to action: "new"
  end

  def show
    card = Card.find_by(user_id: current_user.id)
    customer = Payjp::Customer.retrieve(card.customer_id)
    @default_card_information = customer.cards.retrieve(card.card_id)
    @card_name = card_image(current_user.id)
    
  end

  def card_image(user)
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    card = Card.find_by(user_id: current_user.id)
    customer = Payjp::Customer.retrieve(card.customer_id)
    card = customer.cards.retrieve(customer.default_card)
    card_name = {}
    if card.brand == "Visa"
      card_name[:brand] = "visa.png"
    elsif card.brand == "MasterCard"
      card_name[:brand] = "mastercard.png"
    elsif card.brand == "JCB"
      card_name[:brand] = "jcb.png"
    elsif card.brand == "American Express"
      card_name[:brand] = "americanexpress.png"
    elsif card.brand == "Discover"
      card_name[:brand] = "discover.png"
    elsif card.brand == "Diners Club"
      card_name[:brand] = "dinersclub.png"
    else
      card_name[:brand] = ""
    end
    return card_name
  end
  
  def set_card
    card = Card.find_by(user_id: current_user.id)
  end

  def call_api
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
  end

  def set_parents
    @category_parent = Category.where(ancestry: nil)
  end
end