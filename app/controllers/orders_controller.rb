class OrdersController < ApplicationController
    before_action :authenticate_user!
    
    def new
        @order = Order.new
        @warehouses = Warehouse.all
        @suppliers = Supplier.all
    end

    def create
        order_params = params.require(:order).permit(:warehouse_id, :supplier_id, :estimated_delivery_date)

        @order = Order.new(order_params)

        @order.user = current_user

        @order.save
        redirect_to @order, notice: 'Pedido cadastrado com sucesso.'
        # rails redireciona para o show
    end

    def show
        @order = Order.find(params[:id])
    end
end