import React from 'react';

class ItemDetail extends React.Component {
  constructor(props) {
    super(props);
  }


  render () {
    return (
      <div>
        <ul>
          <li>happiness: {this.props.item.happiness}</li>
          <li>name: {this.props.item.name}</li>
          <li>price: {this.props.item.price}</li>
        </ul>
      </div>
    );
  }
}

export default ItemDetail;
