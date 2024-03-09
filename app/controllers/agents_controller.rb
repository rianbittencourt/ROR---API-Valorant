# app/controllers/agents_controller.rb

class AgentsController < ApplicationController
  def show
    @agent = Champion.find_by(name: params[:name])

    if @agent
      render json: { name: @agent.name, winrate: @agent.winrate, pickrate: @agent.pickrate }
    else
      render json: { error: 'Agente não encontrado' }, status: :not_found
    end
  end
end
