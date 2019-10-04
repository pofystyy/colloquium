import React from 'react'
import ReactDOM from 'react-dom'
import Audios from '../components/Audios'

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Audios />,
    document.body.appendChild(document.createElement('div')),
  )
})