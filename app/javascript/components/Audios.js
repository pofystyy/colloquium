import React, { useRef, useState } from 'react'
import axios from "axios"

const Audios = () => {
  const inputEl = useRef(null)
  const [audios, setAudios] = useState([])

  const sendAudio = e => {
    e.preventDefault()
      if (inputEl.current.files.length) {
        let formData = new FormData()
        formData.append("audio", inputEl.current.files[0])
         axios.post('audios/recognize', formData)
          .then(res => {
            setAudios([{ transcription: res.data.expression }])
          }).finally(() => {
            inputEl.current.value = null
          })
        }
    }

    return (         
      <div>
        <input ref={inputEl} type="file" />
        <button type="submit" onClick={sendAudio}>Recognize</button>
      
        { audios.map((e, key) => { 
          return (                
            <p>Transcription: {e.transcription}</p>
          )
        })}
      </div>
    )
}

export default Audios