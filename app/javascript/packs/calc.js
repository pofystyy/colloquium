import React from 'react'
import ReactDOM from 'react-dom'
import Calculator from '../components/Calculator'

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Calculator />,
    document.body.appendChild(document.createElement('div')),
  )
})