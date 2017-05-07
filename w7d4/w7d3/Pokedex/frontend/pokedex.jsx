import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';

import { createPokemon } from './util/api_util';
import { receiveNewPokemon, createNewPokemon } from './actions/pokemon_actions';
import configureStore from './store/store';
import selectOnePokemon from './reducers/selectors';
import PokemonDetailReducer from './reducers/pokemon_detail_reducer';




document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();


  window.createPokemon = createPokemon;
  window.receiveNewPokemon = receiveNewPokemon;
  window.store = store;
  window.createNewPokemon = createNewPokemon;
  window.selectOnePokemon = selectOnePokemon;
  window.PokemonDetailReducer = PokemonDetailReducer;


  const rootEl = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, rootEl);
});
