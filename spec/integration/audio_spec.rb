require 'swagger_helper'

describe 'Audio API' do

  path '/api/v1/audios/recognize' do

    post 'Call audio recognize' do
      tags 'Recognize'
      security [ basic: [] ]
      let(:auth) { "#{ENV['HTTP_BASE_AUTH_NAME']}:#{ENV['HTTP_BASE_AUTH_PASSWORD']}" }
      consumes 'application/json'
      parameter name: :recognize, in: :body, schema: {
        type: :object,
        properties: {
          audio: { type: :string },
        },
        required: [ 'audio' ]
      }

      response '200', 'ok' do
        let(:Authorization) { "Basic #{::Base64.strict_encode64(auth)}" }
        let(:recognize) { { audio: 'some audio in base64' } }
        run_test!
      end

      response '401', 'unauthorized' do
        let(:recognize) { { audio: 'some audio in base64' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:Authorization) { "Basic #{::Base64.strict_encode64(auth)}" }
        let(:recognize) { { name: 'foo' } }
        run_test!
      end
    end
  end
end
