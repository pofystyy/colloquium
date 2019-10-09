import React from 'react';
import { Link } from 'react-router-dom';
import { Navbar, Nav, NavItem, NavDropdown, MenuItem } from 'react-bootstrap';

export default class Header extends React.Component {
  render() {
    return (
      <nav className="navbar navbar-expand-lg navbar-dark bg-dark custom-nav">        
        <ul className="nav navbar-nav">
          <Link to='/' className='nnavbar-brand nav-item nav-link active'>Home <span className="sr-only">(current)</span></Link>
          <li className="nav-item dropdown">
             <a className="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
               Projects
             </a>
             <div className="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
               <Link to='/api/v1/calculator' className='dropdown-item'>Calculator</Link>
               <Link to='/api/v1/audios' className='dropdown-item'>Audios</Link>
             </div>
          </li>
        </ul>
        <ul className="nav navbar-nav align-self-end ml-auto">
          <li><a target="_blank" className="nav-item nav-link" href="https://github.com/pofystyy">github</a></li>
        </ul>
      </nav>
    )
  }
}

