# app/controllers/agents_controller.rb

class AgentsController < ApplicationController

  def index
    champions = Champion.all
    render json: champions.map { |champion| champion.slice(:name, :winrate, :pickrate) }, status: :ok
  end


  def show
    @agent = Champion.find_by(name: params[:name])

    if @agent
      render json: { name: @agent.name, winrate: @agent.winrate, pickrate: @agent.pickrate }
    else
      render json: { error: 'Agente não encontrado' }, status: :not_found
    end
  end
end
