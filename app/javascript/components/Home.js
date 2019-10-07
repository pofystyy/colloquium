import React from 'react'
import { Link } from "react-router-dom";

class Home extends React.Component {
  render() {
    return (
    <div>
      <Link to='/api/v1/calculator'>Calculator</Link>
      <Link to='/api/v1/audios'>Audios</Link>
    </div>
    )
  }
}

export default Home
