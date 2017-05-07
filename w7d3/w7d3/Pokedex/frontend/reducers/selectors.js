import { values } from 'lodash';
const selectAllPokemon = ({ pokemon }) => {
  return values(pokemon);
};

export default selectAllPokemon;
