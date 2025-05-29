module Api
  module V1
    class MiceController < ApplicationController
      def index
        @mice = Mouse.all
        render json: @mice.as_json(include: :baby_mouses)
      end
    end
  end
end
