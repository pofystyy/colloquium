import React from 'react'
import { Link } from "react-router-dom";

class Home extends React.Component {
  render() {
    return (
    <div>
      <p><Link to='/api/v1/calculator'>Calculator</Link></p>
      <p><Link to='/api/v1/audios'>Audios</Link></p>
    </div>
    )
  }
}

export default Home
