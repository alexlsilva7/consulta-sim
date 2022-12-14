class ConsultaController < ApplicationController
  before_action :set_consultum, only: %i[ show edit update destroy ]

  # GET /consulta or /consulta.json
  def index
    @consulta = Consultum.all
  end

  # GET /consulta/1 or /consulta/1.json
  def show
  end

  # GET /consulta/new
  def new
    @consultum = Consultum.new
    @paciente = Paciente.find(params[:paciente_id])
  end

  # GET /consulta/1/edit
  def edit
  end

  # POST /consulta or /consulta.json
  def create
    @paciente = Paciente.find(params[:paciente_id])
    @consultum = @paciente.consultums.create(consultum_params)
    if @consultum.valid?
      @consultum.paciente_id = @paciente.id
      redirect_to paciente_path(@paciente)
    end

  end

  # PATCH/PUT /consulta/1 or /consulta/1.json
  def update
    respond_to do |format|
      if @consultum.update(consultum_params)
        format.html { redirect_to consultum_url(@consultum), notice: "Consultum was successfully updated." }
        format.json { render :show, status: :ok, location: @consultum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @consultum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consulta/1 or /consulta/1.json
  def destroy
    @consultum.destroy

    respond_to do |format|
      format.html { redirect_to consulta_url, notice: "Consultum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consultum
      @consultum = Consultum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def consultum_params
      params.require(:consultum).permit(:data, :horario, :paciente_id, :medico_id)
    end
end
