class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    if !user_signed_in? || @item.order_ids.present?
      redirect_to root_path
    else
      @order_form = OrderForm.new
    end
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :addresses, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
