class ElectionsController < ApplicationController
  before_action :set_election, only: [:vote, :show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  # GET /elections
  # GET /elections.json
  def index
    @elections = Election.order(id: :desc)
  end

  # GET /elections/1
  # GET /elections/1.json
  def show

  end

  def vote
    if current_user.qnt_votes <= 0
      flash[:error] = "Você não tem mais votos."
    else
      if Vote.create(user_id: current_user.id, election_id: @election.id)
        current_user.update(qnt_votes: (current_user.qnt_votes - 1))
        flash[:success] = "Voto computado com sucesso!"
      else
        flash[:error] = "Ocorreu um erro. Tente novamente."
      end
    end
    redirect_to root_path
  end

  # GET /elections/new
  def new
    @election = Election.new
  end

  # GET /elections/1/edit
  def edit
  end

  # POST /elections
  # POST /elections.json
  def create
    @election = Election.new(election_params)
    @election.user_id = current_user.id
    respond_to do |format|
      if @election.save
        format.html { redirect_to @election, notice: 'Election was successfully created.' }
        format.json { render :show, status: :created, location: @election }
      else
        format.html { render :new }
        format.json { render json: @election.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /elections/1
  # PATCH/PUT /elections/1.json
  def update
    respond_to do |format|
      if @election.update(election_params)
        format.html { redirect_to @election, notice: 'Election was successfully updated.' }
        format.json { render :show, status: :ok, location: @election }
      else
        format.html { render :edit }
        format.json { render json: @election.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /elections/1
  # DELETE /elections/1.json
  def destroy
    @election.destroy
    respond_to do |format|
      format.html { redirect_to elections_url, notice: 'Election was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_election
      @election = Election.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def election_params
      params.require(:election).permit(:name, :user_id, :text)
    end
end
