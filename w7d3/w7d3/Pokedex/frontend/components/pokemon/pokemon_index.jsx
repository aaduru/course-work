import React from 'react';

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount(){
    this.props.requestAllPokemon();
  }

  render() {
    const poke = this.props.pokemon.map( (pokemon, id) => (
      <li key={id}>{pokemon.name}<img src={pokemon.image_url} /></li>
    ));

    return (
      <ul>
        {poke}
      </ul>
    );
  }
}

export default PokemonIndex;
