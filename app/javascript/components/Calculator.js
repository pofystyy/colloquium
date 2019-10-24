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

    const response = await axios.post('calculator/add', {
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
      <div className="container">
        <div className="card">
          <h5 className="card-header">Calculator</h5>
          <div className="card-body">
            <h5 className="card-title">Only 'add'</h5>
              <input type='text' className="form-control col-sm-5 custom-input" onChange={this.handleChange} value={this.state.expression} />
              <Button clickHandler={this.onSubmit} text="Сalculate"></Button>
          </div>
          { this.state.log.map((item, i) => {
                return (
                  <div className="card" key={i}>
                    <div className="card-body">
                      <p>{ item }</p>
                    </div>
                  </div>
                )
              })}
          
        </div>
      </div>


 
    )
  }
}
