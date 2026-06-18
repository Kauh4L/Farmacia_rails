class AtendentesController < ApplicationController
  before_action :set_atendente, only: %i[ show edit update destroy ]
 
  # GET /atendentes or /atendentes.json
  def index
    @atendentes = Atendente.all
    @atendentes = @atendentes.page(params[:page]).per(5) # Paginação com Kaminari

    respond_to do |format|
      format.html
      format.csv { send_data @atendentes.to_csv, filename: "atendentes-#{Date.today}.csv" }
    end
  end

  # GET /atendentes/1 or /atendentes/1.json
  def show
  end 
  
# Para gerar a lista PDF 
def download
  @atendentes = Atendente.all
  pdf = Prawn::Document.new
  
  # Cabeçalho do PDF
  pdf.text "Relatório Geral de Atendentes", size: 24, style: :bold
  pdf.text "Gerado em: #{Time.now.strftime('%d/%m/%Y %H:%M')}"
  pdf.move_down 20

  # 2. Faz um laço (loop) para listar cada atendente
  @atendentes.each do |atendente|
    # Substitua :nome e :email pelos campos reais da sua tabela de atendentes
    pdf.text "ID: #{atendente.id} | Nome: #{atendente.nome}", size: 12
    pdf.text "CPF: #{atendente.cpf} | Telefone:  #{atendente.telefone}"
    pdf.stroke_horizontal_line 0, 540 # Desenha uma linha divisória discreta
    pdf.move_down 10
  end

  send_data pdf.render, 
            filename: "relatorio_geral_atendentes.pdf", 
            type: "application/pdf", 
            disposition: "inline"
end

  def lista
  @atendentes = Atendente.all
  end

  # GET /atendentes/new
  def new
    @atendente = Atendente.new
  end

  # GET /atendentes/1/edit
  def edit
  end

  # POST /atendentes or /atendentes.json
  def create
    @atendente = Atendente.new(atendente_params)

    respond_to do |format|
      if @atendente.save
        format.html { redirect_to @atendente, notice: "Atendente was successfully created." }
        format.json { render :show, status: :created, location: @atendente }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @atendente.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /atendentes/1 or /atendentes/1.json
  def update
    respond_to do |format|
      if @atendente.update(atendente_params)
        format.html { redirect_to @atendente, notice: "Atendente was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @atendente }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @atendente.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /atendentes/1 or /atendentes/1.json
  def destroy
    @atendente.destroy!

    respond_to do |format|
      format.html { redirect_to atendentes_path, notice: "Atendente was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atendente
      @atendente = Atendente.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def atendente_params
      params.require(:atendente).permit(:nome, :cpf, :telefone)
    end

end

