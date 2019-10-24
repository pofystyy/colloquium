class Speech
	def self.api_recognize(audio_file)
		all_recognize(audio_file)
	end

	def self.recognize(audio_file)
		all_recognize(File.binread(audio_file))
	end

	private

	def self.all_recognize(audio_file)
		audio  = { content: audio_file }

		response = speech.recognize config, audio
		results  = response.results

		alternatives = results.first.alternatives
		alternatives.each do |alternative|
			return alternative.transcript
		end
	end

	def self.speech
		Google::Cloud::Speech.new
	end

	def self.config 
		{ encoding:          :LINEAR16,
		  sample_rate_hertz: 16_000,
		  language_code:     "en-US" }
	end
end
