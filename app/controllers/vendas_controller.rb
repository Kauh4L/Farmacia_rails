class VendasController < ApplicationController
  before_action :set_venda, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  # GET /vendas or /vendas.json
  def index
    @vendas = Venda.all
    @vendas = Venda.page(params[:page]).per(5)
  end

  def download
    # 1. Cria um novo documento PDF usando o Prawn
    pdf = Prawn::Document.new
    
    # 2. Escreve o conteúdo do PDF
    pdf.text "Relatorio da Farmacia", size: 30, style: :bold
    pdf.text "Gerado em: #{Time.now.strftime('%d/%m/%Y %H:%M')}"
    pdf.move_down 20
    pdf.text "Aqui vao aparecer os dados das suas vendas e medicamentos cadastrados."

    # 3. Envia o arquivo diretamente para o navegador do usuário baixar
    send_data pdf.render, 
              filename: "relatorio_farmacia.pdf", 
              type: "application/pdf", 
              disposition: "inline" # "inline" abre no navegador, "attachment" baixa direto
  end
  
  # GET /vendas/1 or /vendas/1.json
  def show
  end

  # GET /vendas/new
  def new
    @venda = Venda.new
  end

  # GET /vendas/1/edit
  def edit
  end

  # POST /vendas or /vendas.json
  def create
    @venda = Venda.new(venda_params)

    respond_to do |format|
      if @venda.save
        format.html { redirect_to @venda, notice: "Venda was successfully created." }
        format.json { render :show, status: :created, location: @venda }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @venda.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /vendas/1 or /vendas/1.json
  def update
    respond_to do |format|
      if @venda.update(venda_params)
        format.html { redirect_to @venda, notice: "Venda was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @venda }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @venda.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /vendas/1 or /vendas/1.json
  def destroy
    @venda.destroy!

    respond_to do |format|
      format.html { redirect_to vendas_path, notice: "Venda was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venda
      @venda = Venda.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def venda_params
      params.require(:venda).permit(:atendente_id, :medicamento_id, :quantidade, :total)
    end
end
