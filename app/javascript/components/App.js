import React from 'react'
import { BrowserRouter, Route, Switch } from 'react-router-dom'
import Header from './Header';
import Home from './Home'
import Audios from './Audios'
import Calculator from './Calculator'

export default class App extends React.Component {
  render() {
    return (
      <div>
        <BrowserRouter>
          <Header/>
          <Switch>
            <Route exact path="/" component={Home} />
            <Route path="/calculator" component={Calculator} />
            <Route path="/audio" component={Audios} />
          </Switch>
        </BrowserRouter>
      </div>
    )
  }
}

