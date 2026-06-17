class VendasController < ApplicationController
  before_action :set_venda, only: %i[ show edit update destroy ]
  
  # GET /vendas or /vendas.json
  def index
    @vendas = Venda.all
  end

  def download
      @vendas = Venda.all
      pdf = Prawn::Document.new
      # Cabeçalho do PDF
      pdf.text "Relatório Geral de Vendas", size: 24, style: :bold
      pdf.text "Gerado em: #{Time.now.strftime('%d/%m/%Y %H:%M')}"
      pdf.move_down 20

      # 2. Faz um laço (loop) para listar cada venda
      @vendas.each do |venda|
        # Substitua :nome e :email pelos campos reais da sua tabela de vendas
        pdf.text "VENDA #{venda.id}:"
        pdf.text "ID: #{venda.id} | Atendente: #{venda.atendente.nome}", size: 12
        pdf.text "Medicamento: #{venda.medicamento.nome} | Quantidade:  #{venda.quantidade}" 
        pdf.text "Total: #{venda.calcular_total}"
        pdf.stroke_horizontal_line 0, 540 # Desenha uma linha divisória discreta
        pdf.move_down 10
      end
      
      send_data pdf.render, 
              filename: "relatorio_geral_vendas.pdf", 
              type: "application/pdf", 
              disposition: "inline"

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
