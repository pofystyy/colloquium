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
         axios.post('audios', formData, {
                headers: {
                    'Content-Type': 'multipart/form-data'
                }
            })
          .then(res => {
            setAudios([ ...audios, { transcription: res.data.expression }])
          }).finally(() => {
            inputEl.current.value = null
          })
        }
    }
       
    return (
      <section>
        <div className={"container"}>
          <form>
            <div>
              <input ref={inputEl} id="#file" type="file" />
              <button type="submit" onClick={sendAudio}>Recognize</button>
            </div>
            { audios.map((e, key) => {
              return (
                <div key={key}>
                  <p>Transcription: {e.transcription}</p>
                </div>
              )
            })}
          </form>
        </div>
      </section>
    )
}

export default Audios
