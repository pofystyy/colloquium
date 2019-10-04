class Speech
	def self.recognize(audio)
		audio_file = File.binread audio
		audio  = { content: audio_file }

		response = speech.recognize config, audio
		results  = response.results

		alternatives = results.first.alternatives
		alternatives.each do |alternative|
			return alternative.transcript
		end
	end

	private

	def self.speech
		Google::Cloud::Speech.new
	end

	def self.config 
		{ encoding:          :LINEAR16,
		  sample_rate_hertz: 16_000,
		  language_code:     "en-US" }
	end
end