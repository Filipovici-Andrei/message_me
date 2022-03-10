class MessageController < ApplicationController
  before_action :require_user

  def create
    message = current_user.messages.build(message_params)
    if message.save
      ActionCable.server.broadcast 'chatroom_channel', mod_message: render_message(message)
    else
      flash.now[:error] = 'Something went wrong'
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def render_message(message)
    render(partial: 'messages/message', locals: { message: message })
  end
end
