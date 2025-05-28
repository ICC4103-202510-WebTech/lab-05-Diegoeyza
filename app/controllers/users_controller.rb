class UsersController<ApplicationController
  before_action :authenticate_user!, except: [:index]
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
      @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:notice] = "User saved successfully"
        redirect_to users_path
      else
        flash[:alert] = "#{@user.errors.full_messages.join(", ")}"
        redirect_to edit_user_path(@user)
      end
    end

    def user_params
        params.require(:user).permit(:email, :first_name, :last_name)
    end
end