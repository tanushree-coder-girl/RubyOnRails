class NotesController < ApplicationController
    before_action :set_note, only: [:edit, :update, :show, :destroy]
    def index
        @notes = Note.all
    end
    def new
        @note = Note.new
    end

    def edit 
        #@note = Note.find(params[:id])
    end

    def create
        #render plain: params[:note].inspect
        @note = Note.new(note_params)
        #@note.save
        #redirect_to notes_path(@note)

        if @note.save
            flash[:notice] = "Note Was Successfully Created"
            redirect_to note_path(@note)
        else
            render 'new'
        end
    end

    def update
        #@note = Note.find(params[:id])
        if @note.update (note_params)
            flash[:notice] = "Note Was Successfully Updated"
            redirect_to note_path(@note)
        else
            render 'edit'
        end
    end

    def show 
        #@note = Note.find(params[:id])
    end

    def destroy
        #@note = Note.find(params[:id])
        @note.destroy
        flash[:notice] = "Note was successfully deleted"
        redirect_to notes_path
    end

    private
    def set_note
        @note = Note.find(params[:id])
    end

    def note_params
        params.require(:note).permit(:title, :description)
    end
end