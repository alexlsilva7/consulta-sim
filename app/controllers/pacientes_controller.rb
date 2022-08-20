class PacientesController < ApplicationController
  before_action :set_paciente, only: %i[ show edit update destroy  ]

  # GET /pacientes or /pacientes.json
  def index
    @pacientes = Paciente.all
  end

  # GET /pacientes/1 or /pacientes/1.json
  def show
    @consultums = Consultum.all.where(:paciente_id => params[:id])
  end

  def newConsulta
    @paciente = Paciente.find(params[:id])
    @consultum = Consultum.new
  end

  def createConsulta
    @consultum = Consultum.new(consulta_params)
    @consultum.paciente_id = @paciente.id

    respond_to do |format|
      if @consultum.save
        format.html { redirect_to consultum_url(@consultum), notice: "Consultum was successfully created." }
        format.json { render :show, status: :created, location: @consultum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @consultum.errors, status: :unprocessable_entity }
      end
    end

    # @consultum = Consultum.new(consulta_params)
    # respond_to do |format|
    #   if @consultum.valid?
    #     @consultum.paciente_id = @paciente.id
    #     @consultum.save
    #       format.html { redirect_to paciente_url(@paciente), notice: "Consulta criada was successfully created." }
    #       format.json { render :show, status: :created, location: @paciente }
    #     else
    #       format.html { render :new, status: :unprocessable_entity }
    #       format.json { render json: @consultum.errors, status: :unprocessable_entity }
    #     end
    #
    # end
  end

  # GET /pacientes/new
  def new
    @paciente = Paciente.new
    # @endereco = Endereco.new
    @paciente.build_endereco
  end

  # GET /pacientes/1/edit
  def edit
    if @endereco.nil?
      @endereco = Endereco.new
    end
  end

  # POST /pacientes or /pacientes.json
  def create

    @paciente = Paciente.new(paciente_params)
    # @endereco = Endereco.new(endereco_params)

    @paciente.endereco = Endereco.new(paciente_params[:endereco_attributes])

    respond_to do |format|
      if @paciente.save
        format.html { redirect_to paciente_url(@paciente), notice: "Paciente was successfully created." }
        format.json { render :show, status: :created, location: @paciente }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @paciente.errors, status: :unprocessable_entity }
      end
    end
    # respond_to do |format|
    #   if @paciente.valid?
    #     @paciente.save
    #     @endereco.paciente_id = @paciente.id
    #     if @endereco.valid?
    #       @endereco.save
    #       format.html { redirect_to paciente_url(@paciente), notice: "Paciente was successfully created." }
    #       format.json { render :show, status: :created, location: @paciente }
    #     else
    #       @paciente.destroy
    #       format.html { render :new, status: :unprocessable_entity }
    #       format.json { render json: @paciente.errors, status: :unprocessable_entity }
    #       format.json { render json: @endereco.errors, status: :unprocessable_entity }
    #     end
    #   else
    #     @paciente.save
    #     @endereco.paciente_id = @paciente.id
    #     @endereco.valid?
    #
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @paciente.errors, status: :unprocessable_entity }
    #     format.json { render json: @endereco.errors, status: :unprocessable_entity }
    #     @paciente.destroy
    #   end
    # end

  end

  # PATCH/PUT /pacientes/1 or /pacientes/1.json
  def update
    respond_to do |format|
      @paciente.attributes = paciente_params
      if @paciente.valid?
        @paciente.update(paciente_params)
        if @endereco.valid?
          @endereco.update(endereco_params)
          format.html { redirect_to paciente_url(@paciente), notice: "Paciente was successfully created." }
          format.json { render :show, status: :created, location: @paciente }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @paciente.errors, status: :unprocessable_entity }
          format.json { render json: @endereco.errors, status: :unprocessable_entity }
        end
      else
        @endereco.valid?
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @paciente.errors, status: :unprocessable_entity }
        format.json { render json: @endereco.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pacientes/1 or /pacientes/1.json
  def destroy
    @paciente.destroy

    respond_to do |format|
      format.html { redirect_to pacientes_url, notice: "Paciente was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paciente
      @paciente = Paciente.find(params[:id])
      @endereco = Endereco.find_by_paciente_id(@paciente.id)
    end

    # Only allow a list of trusted parameters through.
    def paciente_params
      params.require(:paciente).permit(:nome_completo, :data_nascimento, :cpf, :email, endereco_attributes: [:id, :cep, :cidade, :bairro, :logradouro, :complemento, :paciente_id])
    end

    def endereco_params
      params.require(:endereco).permit(:cep, :cidade, :bairro, :logradouro, :complemento, :paciente_id)
    end

    def consulta_params
      params.require(:consultum).permit(:data, :horario, :medico_id)
    end
end
