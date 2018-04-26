class IngredientsController < ApplicationController
  before_action :set_ingredient, except: :create
  before_action :set_recipe

  # GET /ingredients
  # GET /ingredients.json
  #def index
   # @ingredients = Ingredient.all
  #end

  # GET /ingredients/1
  # GET /ingredients/1.json
  #def show
  #end

  # GET /ingredients/new
  #def new
    #@ingredient = Ingredient.new
  #end

  # GET /ingredients/1/edit
  #def edit
  #end

  # POST /ingredients
  # POST /ingredients.json
  def create
    @recipe.ingredients.create(ingredient_params)
    redirect_to @recipe
  end

  # PATCH/PUT /ingredients/1
  # PATCH/PUT /ingredients/1.json
  def update
    respond_to do |format|
      if @ingredient.update(ingredient_params)
        format.html { redirect_to @ingredient, notice: 'Ingredient was successfully updated.' }
        format.json { render :show, status: :ok, location: @ingredient }
      else
        format.html { render :edit }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredients/1
  # DELETE /ingredients/1.json
  def destroy
    @ingredient.destroy
    redirect_to @recipe
  end

  private

    def set_recipe
      @recipe = Recipe.find(params[:recipe_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ingredient_params
      params.require(:ingredient).permit(:name, :amount, :recipe_id)
    end
end
