import { connect } from 'react-redux';
import PokemonForm from './pokemon_form';
import { createNewPokemon } from '../../actions/pokemon_actions';

const mapDispatchToProps = dispatch => ({
  createPokemon: (pokemon) => dispatch(createNewPokemon(pokemon))
});

export default connect (
  mapDispatchToProps
)(PokemonForm);
