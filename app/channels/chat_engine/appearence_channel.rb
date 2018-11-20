module ChatEngine
  class AppearenceChannel < ApplicationCable::Channel
    def subscribed
      stream_from "appearence" if params[:user_id]
      user = params[:user_id].split('_') if params[:user_id]
      user[0].constantize.find(user[1].to_i).update(online:true) if params[:user_id]
      # stream_from "some_channel"
    end

    def unsubscribed
      user = params[:user_id].split('_') if params[:user_id]
      user[0].constantize.find(user[1].to_i).update(online: false) if params[:user_id]
      # Any cleanup needed when channel is unsubscribed
    end
  end
end
