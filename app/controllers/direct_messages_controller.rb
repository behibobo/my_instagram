class DirectMessagesController < ApplicationController

    def index
        messages = current_user.direct_messages.order(:created_at).group_by(&:from_id).to_a
        data = []
        messages.each do |message|
            user = User.find(message.first)

            my_messages = DirectMessage.where(from_id: current_user.id).where(to_id: user.id).to_a
            all_messages = message.last + my_messages
            res = {
                user: ActiveModelSerializers::SerializableResource.new(user),
                messages: all_messages.sort_by {|m| m[:created_at]}
            }

            data << res

        end

        render json: data.to_json
    end


    def create
        message = DirectMessage.new(message_params)
        message.from_id = current_user.id

        message.save!
        render json: message.to_json
    end

    private
    def message_params
        params.require(:direct_message).permit(:to_id, :body)
    end
end
