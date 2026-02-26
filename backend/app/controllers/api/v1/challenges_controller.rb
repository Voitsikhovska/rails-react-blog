module Api::V1
  class ChallengesController < ApplicationController
    before_action :set_challenge, only: [:show, :update, :destroy]
    def index
      @challenges = Challenge.all
      render json: @challenges
    end

    def create
      @challenge = Challenge.new(challenge_params)
      if @challenge.save
        render json: @challenge, status: :created
      else
        render json: @challenge.errors, status: :unprocessable_entity
      end
    end

    def show
      @challenge = Challenge.find(params[:id])
      render json: @challenge
    end

    def update
      @challenge = Challenge.find(params[:id])
      if @challenge.update(challenge_params)
        render json: @challenge
      else
        render json: @challenge.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @challenge = Challenge.find(params[:id])
      @challenge.destroy
    end

    private

    def set_challenge
      @challenge = Challenge.find(params[:id])
    end

    def challenge_params
      params.require(:challenge).permit(:title, :description, :start_date, :end_date)
    end
  end
end