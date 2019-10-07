import React from 'react'
import { BrowserRouter, Route, Switch } from 'react-router-dom'
import Home from './Home'
import Audios from './Audios'
import Calculator from './Calculator'

export default class App extends React.Component {
  render() {
    return (
      <div>
        <BrowserRouter>
          <Switch>
            <Route exact path="/" component={Home} />
            <Route path="/api/v1/calculator" component={Calculator} />
            <Route path="/api/v1/audios" component={Audios} />
          </Switch>
        </BrowserRouter>
      </div>
    )
  }
}

