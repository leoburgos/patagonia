class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    if !session[:date].nil?
      @user.birth_date= session[:date]
      session[:date] = nil
    end
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      bonus_code = BonusCode.first
      body = bonus_code.code
      users_to_report = [@user.mail]
      ApplicationMailer.patagonia_bonus(users_to_report, body, 'Bar Patagonia').deliver_now!
      bonus_code.code += 1
      bonus_code.save
       redirect_to action: :new
    else
      respond_to do |format|
        format.js
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def user_modal
    respond_to do |format|
      format.js { render :user_modal }
    end
  end

  def set_date
    session['date'] = params[:day] + '/' + params[:month] + '/' + params[:year]
    render :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :mail, :birth_date, :tel, :return_rate, :recommendation_rate, :suggestions)
    end
end
