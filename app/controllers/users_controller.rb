class UsersController < ApplicationController
	def home
	end

	def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to user_path(@user)}
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  	@user =  User.find_by_id(params[:id])
		if @user.gender == "Male"
			@bmr = (10 * @user.weight) + (6.25 * @user.height) - (5 * @user.age) + 5
		else
			@bmr = (10 * @user.weight) + (6.25 * @user.height) - (5 * @user.age) - 161
		end
		if @user.intake == "Sedentary or light activity"
			@total_calories = @bmr * 1.53
		elsif @user.intake == "Active or moderately active"
			@total_calories = @bmr * 1.76
		else
			@total_calories = @bmr * 2.25
		end		
  end

	private

	def users_params
    params.require(:user).permit(:gender, :weight, :height, :age, :intake)
  end

end
