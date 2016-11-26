module Api
  module V1
    class HbcusController < ApplicationController

      def index
        render json: Hbcu.all
      end
    end
  end
end
