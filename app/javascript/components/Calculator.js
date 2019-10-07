import React from 'react'
import axios from 'axios'
import Button from './Button'

export default class Calculator extends React.Component {
  state = {
    expression: '',
    log: [],
  }

  handleChange = (event) => {
    this.setState({ expression: event.target.value })
  }

  onSubmit = async () => {
    const expression = this.state.expression
    const currentLog = this.state.log

    const response = await axios.post('calculator', {
      text: expression,
    }).catch((e) => ({ data: 'Err' }))

    const result = response.data

    this.setState({
      expression: '',
      log: [`${expression.replace(/ /g, '+')} = ${result}`].concat(currentLog)
    })
  }

  render() {
    return (
      <div>
        <input type='text' onChange={this.handleChange} value={this.state.expression} />
        <Button clickHandler={this.onSubmit} text="Сalculate"></Button>
        {
          this.state.log.map((item, i) => <p key={i}>{ item }</p>)
        }
      </div>
    )
  }
}
