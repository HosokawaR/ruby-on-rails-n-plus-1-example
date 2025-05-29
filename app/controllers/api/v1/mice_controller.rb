module Api
  module V1
    class MiceController < ApplicationController
      def index
        @mice = Mouse.all
        render json: @mice.as_json(include: :baby_mouses)
      end

      def counts
        @mice = Mouse.all
        render json: @mice.map { |mouse|
          {
            id: mouse.id,
            name: mouse.name,
            baby_mouses_count: mouse.baby_mouses.count
          }
        }
      end
    end
  end
end
