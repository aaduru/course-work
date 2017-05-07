import { values } from 'lodash';
export const selectAllPokemon = ({ pokemon }) => {
  return values(pokemon);
};

export const selectPokemonItem = (state, itemId) => {
  return (state.pokeDetail.items.find((item) => parseInt(itemId) === item.id));
};
