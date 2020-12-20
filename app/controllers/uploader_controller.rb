class UploaderController < ApplicationController
    def create
        if params[:image]
            image = Image.new(image: params[:image])
            if image.save!
                render json: {image: image.image.url}, status: :created
            else 
                render json: [], status: :unprocessable_entity
            end
        end
    end
end
