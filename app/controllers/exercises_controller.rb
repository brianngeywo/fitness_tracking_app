class ExercisesController < ApplicationController
  before_action :get_workout
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]

  # GET /exercises
  # GET /exercises.json
  def index
    @exercises = @workout.exercises
  end

  # GET /exercises/1
  # GET /exercises/1.json
  def show
  end

  # GET /exercises/new
  def new
    @exercise = @workout.exercises.build
  end

  # GET /exercises/1/edit
  def edit
  end

  # POST /exercises
  # POST /exercises.json
  def create
    @exercise = @workout.exercises.build(exercise_params)

    respond_to do |format|
      if @exercise.save
        format.html { redirect_to workout_exercises_path(@workout), notice: 'Exercise was successfully created.' }
        format.json { render :show, status: :created, location: @exercise }
      else
        format.html { render :new }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exercises/1
  # PATCH/PUT /exercises/1.json
  def update
    respond_to do |format|
      if @exercise.update(exercise_params)
        format.html { redirect_to workout_exercise_path(@exercise), notice: 'Exercise was successfully updated.' }
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
    respond_to do |format|
      format.html { redirect_to workout_exercises_path, notice: 'Exercise was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def get_workout
    @workout = Workout.find(params[:workout_id])
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise
      @exercise = @workout.exercises.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exercise_params
      params.require(:exercise).permit(:name, :sets, :reps, :workout_id)
    end
end
