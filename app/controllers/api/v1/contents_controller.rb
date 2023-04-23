#frozen_string_literal: true

module Api
  module V1
    class ContentsController < ApplicationController
      def index
        render json: contents, status: :ok
      end

      def root
        render json: { message: 'It works!' }, status: :ok
      end

      private

      def content_type
        params[:content_type]
      end

      def content_params
        params.require(:content).permit(:content_type)
      end

      def contents
        return Content.all.ordered if content_type.nil?

        Content.send(content_type.pluralize).ordered
      end
    end
  end
end
