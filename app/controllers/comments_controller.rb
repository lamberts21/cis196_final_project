class CommentsController < ApplicationController
  before_action :set_comment, except: :create
  before_action :set_workout

  def create
    @workout.comments.create(comment_params)
    redirect_to @workout
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    redirect_to @workout
  end

  private

  def set_workout
    @workout = Workout.find(params[:workout_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:field)
  end
end
