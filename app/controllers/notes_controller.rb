class NotesController < ApplicationController
  before_action :set_note, only: %i[ show edit update destroy ]
  before_action :set_q, only: [:index, :search]

  # GET /notes or /notes.json
  def index
    @notes = Note.all.where(user_id: current_user.id).page(params[:note]).per(12)
    @notes = params[:label_id].present? ? Label.find(params[:label_id]).notes : @notes
  end

  # GET /notes/1 or /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes or /notes.json
  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    url = @note.youtube
    url = url.last(11)
    @note.youtube = url

    respond_to do |format|
      if @note.save
        format.html { redirect_to note_url(@note), notice: "Note was successfully created." }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1 or /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to note_url(@note), notice: "Note was successfully updated." }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1 or /notes/1.json
  def destroy
    @note.destroy

    respond_to do |format|
      format.html { redirect_to notes_url, notice: "Note was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def search
    @results = @q.result
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_note
    @note = Note.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def note_params
    params.require(:note).permit(:note_title, :text, :youtube, :user_id, label_ids: [])
  end

  def set_q
    @q = Note.ransack(params[:q])
  end 
end
