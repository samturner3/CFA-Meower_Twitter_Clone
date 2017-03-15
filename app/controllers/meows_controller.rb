class MeowsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_meow, only: [:show, :edit, :update, :destroy, :toggle_like]

  # GET /meows
  # GET /meows.json
  def index
    @meows = Meow.all
  end

  # GET /meows/1
  # GET /meows/1.json
  def show
    @like_status = current_user.likes?(@meow) ? 'Unlike' : 'Like'
  end

  # GET /meows/new
  def new
    @meow = Meow.new
  end

  # GET /meows/1/edit
  def edit
  end

  def toggle_like
  current_user.toggle_like!(@meow)
  redirect_to :back
  end

  # POST /meows
  # POST /meows.json
  def create
    @meow = Meow.new(meow_params)
    @meow.user_id = current_user.id

    respond_to do |format|
      if @meow.save
        format.html { redirect_to @meow, notice: 'Meow was successfully created.' }
        format.json { render :show, status: :created, location: @meow }
      else
        format.html { render :new }
        format.json { render json: @meow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meows/1
  # PATCH/PUT /meows/1.json
  def update
    respond_to do |format|
      if @meow.update(meow_params)
        format.html { redirect_to @meow, notice: 'Meow was successfully updated.' }
        format.json { render :show, status: :ok, location: @meow }
      else
        format.html { render :edit }
        format.json { render json: @meow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meows/1
  # DELETE /meows/1.json
  def destroy
    @meow.destroy
    respond_to do |format|
      format.html { redirect_to meows_url, notice: 'Meow was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meow
      @meow = Meow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meow_params
      params.require(:meow).permit(:content)
    end
end
