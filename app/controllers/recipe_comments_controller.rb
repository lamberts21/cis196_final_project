class RecipeCommentsController < ApplicationController
  before_action :set_recipe_comment, except: :create
  before_action :set_recipe

  def create
    @recipe.recipe_comments.create(recipe_comment_params)
    redirect_to @recipe
  end

  # PATCH/PUT /recipe_comments/1
  # PATCH/PUT /recipe_comments/1.json
  def update
    respond_to do |format|
      if @recipe_comment.update(recipe_comment_params)
        format.html { redirect_to @recipe_comment, notice: 'Recipe comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe_comment }
      else
        format.html { render :edit }
        format.json { render json: @recipe_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_comments/1
  # DELETE /recipe_comments/1.json
  def destroy
    @recipe_comment.destroy
    redirect_to @recipe
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe_comment
    @recipe_comment = RecipeComment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def recipe_comment_params
    params.require(:recipe_comment).permit(:field, :recipe_id, :user_id)
  end
end
