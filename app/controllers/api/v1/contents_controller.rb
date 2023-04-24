#frozen_string_literal: true

module Api
  module V1
    class ContentsController < ApplicationController
      def index
        render json: contents.paginate(page: params[:page], per_page: params[:per_page]),
               each_serializer: ContentSerializer,
               status: :ok,
               meta: {
                 page:     params[:page],
                 per_page: params[:per_page],
                 total:    contents.count
                }
      end

      def root
        render json: { message: 'It works!' }, status: :ok
      end

      private

      def content_type
        params[:content_type]
      end

      def content_params
        params.require(:content).permit(:content_type, :per_page, :page)
      end

      def contents
        Rails.cache.fetch(Content.cache_key) do
          Contents.call(content_type).load
        end
      end
    end
  end
end
