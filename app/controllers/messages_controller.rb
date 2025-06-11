class MessagesController<ApplicationController
    authorize_resource unless: :devise_controller?
    def index
        @messages = Message.accessible_by(current_ability)  
    end
    def show
        @message=Message.find(params[:id])
    end

    def new
      @message = Message.new
      @chats = Chat.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
    end
        
    def edit
      @message = Message.find(params[:id])
      @chats = Chat.all  # or Chat.involving(current_user.id) if you want to restrict it
    end
    

    def create
      @message = Message.new(message_params)
      @message.user = current_user
      @chats = Chat.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)

        if @message.save
          redirect_to @message
        else
          render :new
        end
    end
    
    def update
      @message = Message.find(params[:id])
      if @message.update(message_params)
        flash[:notice] = "Message saved successfully"
        redirect_to messages_path
      else
        flash[:alert] = "#{@message.errors.full_messages.join(", ")}"
        redirect_to edit_message_path(@message)
      end
    end
    
    private
    def message_params
        params.require(:message).permit(:chat_id, :body)
    end
end