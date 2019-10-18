import React from 'react'
import { Link } from "react-router-dom"
import calc from '/Users/tromas/Downloads/calc1.jpg'
import speech from '/Users/tromas/Downloads/speech.jpg'

class Home extends React.Component {
  render() {
    return (
    <div className={"container"}>
      <h1 className="text-center">Colloquium</h1>
      	<div className="flex-container">
      	  <Link to='/calculator' className='flex-child img'><img src={calc} /></Link>
      	  <Link to='/audio' className='flex-child img'><img src={speech} /></Link>         
        </div>
    </div>
    )
  }
}

export default Home
