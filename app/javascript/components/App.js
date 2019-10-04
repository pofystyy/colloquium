import React from 'react'
import { Route, Switch } from 'react-router-dom'
import Audios from './Audios'
import Calculator from './Calculator'

export default class App extends React.Component {
  render() {
    return (
      <div>
        <Switch>
          <Route path="/calculator/add" component={Calculator} />
          <Route path="/audios/recognize" component={Audios} />
        </Switch>
      </div>
    )
  }
}