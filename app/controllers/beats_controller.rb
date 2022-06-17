class BeatsController < ApplicationController
  before_action :set_beat, only: %i[ show edit update destroy ]
  before_action :set_q, only: [:index, :search]

  # GET /beats or /beats.json
  def index
    @beats = Beat.all.where(user_id: current_user.id).page(params[:beat]).per(1)
    @beats = params[:category_id].present? ?  Category.find(params[:category_id]).beats: @beats
  end

  # GET /beats/1 or /beats/1.json
  def show
  end

  # GET /beats/new
  def new
    @beat = Beat.new
  end

  # GET /beats/1/edit
  def edit
  end

  # POST /beats or /beats.json
  def create
    @beat = Beat.new(beat_params)
    @beat.user_id = current_user.id
    
    respond_to do |format|
      if @beat.save
        format.html { redirect_to beat_url(@beat), notice: "Beat was successfully created." }
        format.json { render :show, status: :created, location: @beat }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /beats/1 or /beats/1.json
  def update
    respond_to do |format|
      if @beat.update(beat_params)
        format.html { redirect_to beat_url(@beat), notice: "Beat was successfully updated." }
        format.json { render :show, status: :ok, location: @beat }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @beat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /beats/1 or /beats/1.json
  def destroy
    @beat.destroy

    respond_to do |format|
      format.html { redirect_to beats_url, notice: "Beat was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def search
    @results = @q.result
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_beat
    @beat = Beat.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def beat_params
    params.require(:beat).permit(:beat_title, :sample_title, :sample_artist, :audio, :beat_time, :memo, category_ids:[])
  end

  def set_q
    @q = Beat.ransack(params[:q])
  end 
end
