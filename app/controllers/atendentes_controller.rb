class AtendentesController < ApplicationController
  before_action :set_atendente, only: %i[ show edit update destroy ]

  # GET /atendentes or /atendentes.json
  def index
    @atendentes = Atendente.all
  end

  # GET /atendentes/1 or /atendentes/1.json
  def show
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

