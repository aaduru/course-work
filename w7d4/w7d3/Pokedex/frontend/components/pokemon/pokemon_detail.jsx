import React from 'react';
import { Link } from 'react-router';

class PokemonDetail extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount(){
    this.props.requestOnePokemon(this.props.params.pokemonId);
  }

  componentWillReceiveProps(newProps) {
    if (this.props.params.pokemonId !== newProps.params.pokemonId) {
      this.props.requestOnePokemon(newProps.params.pokemonId);
    }
  }

  render() {
    if (Object.keys(this.props.pokeDetail).length === 0) {
      return (
        <div>
          loading!!!
        </div>
      );
    } else {
      return (
        <ul className="pokedetail">
          <li>attack {this.props.pokeDetail.attack}</li>
          <li>defense {this.props.pokeDetail.defense}</li>
          <li>id {this.props.pokeDetail.id}</li>
          <li><img src={this.props.pokeDetail.image_url} /></li>
          <li>name {this.props.pokeDetail.name}</li>
          <li>poke_type {this.props.pokeDetail.poke_type}</li>
          <li>moves {this.props.pokeDetail.moves.join(', ')}</li>
          <ul>Items {this.props.pokeDetail.items.map((item, id) => (
              <li>
                <Link to={`/pokemon/${this.props.pokeDetail.id}/item/${item.id}`}>
                  <img src={item.image_url} />
                </Link>
              </li>
            ))}
          </ul>
          {this.props.children}
        </ul>
      );
    }
  }
}

export default PokemonDetail;
