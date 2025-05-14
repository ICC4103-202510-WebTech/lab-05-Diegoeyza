class MessagesController<ApplicationController
    def index
        @messages=Message.all   
    end
    def show
        @message=Message.find(params[:id])
    end
    def new
        @message = Message.new
    end
    
    def edit
        @message = Message.find(params[:id])
    end
    
    def create
        @message = Message.new(message_params)
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
        params.require(:message).permit(:chat_id, :user_id, :body)
    end
end