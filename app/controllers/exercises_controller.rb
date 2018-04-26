class ExercisesController < ApplicationController
  before_action :set_exercise, except: :create
  before_action :set_workout

  # GET /exercises
  # GET /exercises.json
  #def index
    #@exercises = Exercise.all
 # end

  # GET /exercises/1
  # GET /exercises/1.json
  #def show
  #end

  # GET /exercises/new
  #def new
    #@exercise = Exercise.new
  #end

  # GET /exercises/1/edit
  #def edit
  #end

  # POST /exercises
  # POST /exercises.json
  def create
    @workout.exercises.create(exercise_params)
    redirect_to @workout
  end

  # PATCH/PUT /exercises/1
  # PATCH/PUT /exercises/1.json
  def update
    respond_to do |format|
      if @exercise.update(exercise_params)
        format.html { redirect_to @exercise, notice: 'Exercise was successfully updated.' }
        format.json { render :show, status: :ok, location: @exercise }
      else
        format.html { render :edit }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercises/1
  # DELETE /exercises/1.json
  def destroy
    @exercise.destroy
    redirect_to @workout
  end

  private

    def set_workout
      @workout = Workout.find(params[:workout_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_exercise
      @exercise = Exercise.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exercise_params
      params.require(:exercise).permit(:name, :description, :time, :workout_id)
    end
end
