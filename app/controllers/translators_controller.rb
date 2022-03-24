class TranslatorsController < ApplicationController
  before_action :set_translator, only: %i[ show edit update destroy ]

  # GET /translators or /translators.json
  def index
    @translators = Translator.all
  end

  # GET /translators/1 or /translators/1.json
  def show
  end

  # GET /translators/new
  def new
    @translator = Translator.new
  end

  # GET /translators/1/edit
  def edit
  end

  # POST /translators or /translators.json
  def create
    @translator = Translator.new(translator_params)

    respond_to do |format|
      if @translator.save
        format.html { redirect_to translator_url(@translator), notice: "Translator was successfully created." }
        format.json { render :show, status: :created, location: @translator }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @translator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /translators/1 or /translators/1.json
  def update
    respond_to do |format|
      if @translator.update(translator_params)
        format.html { redirect_to translator_url(@translator), notice: "Translator was successfully updated." }
        format.json { render :show, status: :ok, location: @translator }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @translator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /translators/1 or /translators/1.json
  def destroy
    @translator.destroy

    respond_to do |format|
      format.html { redirect_to translators_url, notice: "Translator was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_translator
      @translator = Translator.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def translator_params
      params.require(:translator).permit(:profile_enabled, :slug, :bio, :user_id)
    end
end
