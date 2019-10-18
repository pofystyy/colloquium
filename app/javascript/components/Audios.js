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
         axios.post('audio/recognize', formData, 
         //        headers: {
         //          'Content-Type': 'multipart/form-data'
         //        }
            )
          .then(res => {
            setAudios([ ...audios, { transcription: res.data.expression }])
          }).finally(() => {
            inputEl.current.value = null
          })
        }
    }
       
    return (
      <div className="container">
        <div className="card">
          <h5 className="card-header">Audio Recognizer</h5>
          <div className="card-body">
            <h5 className="card-title">Only 'audio' files</h5>
              <input ref={inputEl} className="form-control-file custom-input" id="exampleFormControlFile1" type="file" />
              <button type="submit" className="btn btn-dark" onClick={sendAudio}>Recognize</button>
          </div>
          { audios.map((e, key) => {
                return (
                  <div className="card" key={key}>
                    <div className="card-body">
                      <p>Transcription: {e.transcription}</p>
                    </div>
                  </div>
                )
              })}
        </div>
      </div>
    )
}

export default Audios
