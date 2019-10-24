require 'rails_helper'

RSpec.configure do |config|
  config.swagger_root = Rails.root.join('swagger').to_s
  config.swagger_docs = {
    'v1/swagger.json' => {
      swagger: '2.0',
      info: {
        title: 'API V1',
        version: 'v1'
      },
      paths: {},
      securityDefinitions: {
        basic: {
          type: :basic
        },
        apiKey: {
          type: :apiKey,
          name: 'api_key',
          in: :query
        }
      }
    }
  }
end
