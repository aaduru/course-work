import { RECEIVE_ALL_POKEMON, RECEIVE_NEW_POKEMON } from '../actions/pokemon_actions';
import merge from 'lodash/merge';

const pokemonReducer = (state = {}, action) => {
  let newState = merge({}, state);
  switch(action.type) {
    case RECEIVE_ALL_POKEMON:
      return merge({}, state, action.pokemon);
    case RECEIVE_NEW_POKEMON:
      newState[action.pokemon.id] = action.pokemon;
      return newState;
    default:
      return state;
  }
};

export default pokemonReducer;
