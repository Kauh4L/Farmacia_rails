class ItemVendasController < ApplicationController
  before_action :set_item_venda, only: %i[ show edit update destroy ]

  # GET /item_vendas or /item_vendas.json
  def index
    @item_vendas = ItemVenda.all
  end

  # GET /item_vendas/1 or /item_vendas/1.json
  def show
  end

  # GET /item_vendas/new
  def new
    @item_venda = ItemVenda.new
  end

  # GET /item_vendas/1/edit
  def edit
  end

  # POST /item_vendas or /item_vendas.json
  def create
    @item_venda = ItemVenda.new(item_venda_params)

    respond_to do |format|
      if @item_venda.save
        format.html { redirect_to @item_venda, notice: "Item venda was successfully created." }
        format.json { render :show, status: :created, location: @item_venda }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @item_venda.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /item_vendas/1 or /item_vendas/1.json
  def update
    respond_to do |format|
      if @item_venda.update(item_venda_params)
        format.html { redirect_to @item_venda, notice: "Item venda was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @item_venda }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @item_venda.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /item_vendas/1 or /item_vendas/1.json
  def destroy
    @item_venda.destroy!

    respond_to do |format|
      format.html { redirect_to item_vendas_path, notice: "Item venda was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_venda
      @item_venda = ItemVenda.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_venda_params
      params.require(:item_venda).permit(:venda_id, :produto_id, :quantidade, :preco_unitario)
    end
end
