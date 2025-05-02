class UsersController<ApplicationController
    def index
        @users=User.all   
    end
    def show
        @user=User.find(params[:id])
    end

    def new
        @user = User.new
    end
      
    def edit
    @user = User.find(params[:id])
    end

    def create
        @user = User.new(user_params)
        if @user.save
          redirect_to @user
        else
          render :new
        end
    end

    def update
        if @user.update(user_params)
          redirect_to @user
        else
          render :edit
        end
    end

    def user_params
        params.require(:user).permit(:email, :first_name, :last_name)
    end
end