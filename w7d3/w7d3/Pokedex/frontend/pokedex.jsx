import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';

import { fetchAllPokemon } from './util/api_util';
import { receiveAllPokemon, requestAllPokemon } from './actions/pokemon_actions';
import configureStore from './store/store';
import selectAllPokemon from './reducers/selectors';



console.log("pokedex");
document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();


  window.fetchAllPokemon = fetchAllPokemon;
  window.receiveAllPokemon = receiveAllPokemon;
  window.store = store;
  window.requestAllPokemon = requestAllPokemon;
  window.selectAllPokemon = selectAllPokemon;


  const rootEl = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, rootEl);
});
