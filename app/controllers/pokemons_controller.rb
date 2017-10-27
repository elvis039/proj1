class PokemonsController < ApplicationController

	def capture
		@pokemon = Pokemon.find(params[:id])
		@pokemon.update(trainer_id: current_trainer.id)
		@pokemon.save
		redirect_to root_path
	end

	def damage
		@pokemon = Pokemon.find(params[:id])
		new_health = @pokemon.health - 10
		if new_health <= 0
			# pokemon.update(trainer_id: nil)
			# pokemon.save
			Pokemon.destroy(params[:id])
		else
			@pokemon.update(health: new_health)
			@pokemon.save
		end
		# redirect_to controller: 'trainers', action: 'show', id: params[:trainer]
		redirect_to trainer_path(current_trainer)
	end

	def new
		@pokemon = Pokemon.new
	end

	def create
		@pokemon = Pokemon.new(pokemon_params)
		if not @pokemon.valid?
			flash[:error] = @pokemon.errors.full_messages.to_sentence
			redirect_to new_path
		else
			@pokemon.update(level: 1, health: 100, trainer_id: current_trainer.id)
			@pokemon.save
			redirect_to trainer_path(current_trainer)
		end
	end

  private

  def pokemon_params
  	params.require(:pokemon).permit(:name)
  end
  
end
