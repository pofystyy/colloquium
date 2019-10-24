import React from 'react'

export default class Button extends React.Component {
  render() {
    return (<button onClick={this.props.clickHandler} className="btn btn-dark">{ this.props.text }</button>)
  }
}
