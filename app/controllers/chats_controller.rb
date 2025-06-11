class ChatsController<ApplicationController
    authorize_resource unless: :devise_controller?
    def index
        @chats = current_user.admin? ? Chat.all : Chat.involving(current_user.id)
    end

    def show
        @chat=Chat.find(params[:id])
    end
    def new
        @chat = Chat.new
    end

    def edit
        @chat = Chat.find(params[:id])
    end

    def create
        @chat = Chat.new(chat_params)
        @chat.sender = current_user
        if @chat.save
            redirect_to @chat
        else
            render :new
        end
    end

    def update
      @chat = Chat.find(params[:id])
      if @chat.update(chat_params)
        flash[:notice] = "Chat saved successfully"
        redirect_to chats_path
      else
        flash[:alert] = "#{@chat.errors.full_messages.join(", ")}"
        redirect_to edit_chat_path(@chat)
      end
    end
    
    private
    def chat_params
        params.require(:chat).permit(:receiver_id)
    end
end