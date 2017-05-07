import { RECEIVE_ONE_POKEMON } from '../actions/pokemon_actions';

const PokemonDetailReducer = (state = {}, action) => {
  switch(action.type){
    case RECEIVE_ONE_POKEMON:
      return action.pokemon;
    default:
      return state;
  }
};

export default PokemonDetailReducer;
