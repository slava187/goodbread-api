class TagsController < ApplicationController
    before_action :authorize_request
    def create
        tag = Tag.create(tag_params)

        if tag.valid?
            render json: {message: "Tag successfully created."}, status: 201
        else
            render json: {message: "Failed to create tag, invalid inputs."}, status: 422
        end
    end

    def index
        tags = Tag.all

        render json: tags.to_json, status: 200
    end

    def show
        tag = Tag.find(params[:id])

        render json: tag.to_json, status: 200
    end

    def update
        tag = Tag.find(params[:id])

        tag.update(tag_params)

        render json: tag.to_json, status: 200
    end

    def destroy
        tag = Tag.find(params[:id])
        
        tag.destroy

        render json: {message: "Tag successfully deleted."}, status: 200
    end

    private

    def tag_params
        params.require(:tag).permit(:id, :label)
    end
end
