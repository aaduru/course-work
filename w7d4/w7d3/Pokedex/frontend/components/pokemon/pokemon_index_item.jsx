import React from 'react';
import { Link } from 'react-router';

const PokemonIndexItem = ({ pokemon, id }) => (
  <li key={id}>
    <Link to={`/pokemon/${pokemon.id}`}>
      {pokemon.name}
      <img src={pokemon.image_url} />
    </Link>
  </li>
);

export default PokemonIndexItem;
