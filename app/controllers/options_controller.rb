class OptionsController < ApplicationController
  before_action :set_option, only: [:show, :edit, :update, :destroy]

  # GET /options
  # GET /options.json
  def index
    @question = Question.find(params[:question_id])
    @options = @question.options
  end

  # GET /options/1
  # GET /options/1.json
  def show
    @question = Question.find(params[:question_id])
  end

  # GET /options/new
  def new
    @question = Question.find(params[:question_id])
    @option = Option.new
  end

  # GET /options/1/edit
  def edit
    @question = Question.find(params[:question_id])
  end

  # POST /options
  # POST /options.json
  def create
    @question = Question.find(params[:question_id])
    @option = Option.new(option_params)

    respond_to do |format|
      if @option.save
        format.html { redirect_to question_options_path(@question), notice: 'Option was successfully created.' }
        format.json { render action: 'show', status: :created, location: @option }
      else
        format.html { render action: 'new' }
        format.json { render json: @option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /options/1
  # PATCH/PUT /options/1.json
  def update
    respond_to do |format|
      if @option.update(option_params)
        format.html { redirect_to question_option_path, notice: 'Option was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /options/1
  # DELETE /options/1.json
  def destroy
    @option.destroy
    respond_to do |format|
      format.html { redirect_to question_options_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_option
      @option = Option.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def option_params
      params.require(:option).permit(:content, :question_id, :value)
    end
end
