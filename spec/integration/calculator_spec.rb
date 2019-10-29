# require 'swagger_helper'

# describe 'Calculator API' do

#   path '/api/v1/calculator/add' do

#     post 'Call calculator add' do
#       tags 'Add'
#       security [ basic: [] ]
#       let(:auth) { "#{ENV['HTTP_BASE_AUTH_NAME']}:#{ENV['HTTP_BASE_AUTH_PASSWORD']}" }
#       consumes 'application/json'
#       parameter name: :add, in: :body, schema: {
#         type: :object,
#         properties: {
#           text: { type: :string },
#         },
#         required: [ 'text' ]
#       }

#       response '200', 'done' do
#         let(:Authorization) { "Basic #{::Base64.strict_encode64(auth)}" }
#         let(:add) { { text: '1 2' } }
#         run_test!
#       end

#       response '401', 'unauthorized' do
#         let(:add) { { text: '1 2' } }
#         run_test!
#       end

#       response '422', 'invalid request' do
#         let(:Authorization) { "Basic #{::Base64.strict_encode64(auth)}" }
#         let(:add) { { name: 'foo' } }
#         run_test!
#       end
#     end
#   end
# end
