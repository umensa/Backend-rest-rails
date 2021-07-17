require 'swagger_helper'

RSpec.describe 'api/v1/users', type: :request do
  let!(:users) { FactoryBot.create_list(:user, 10) }
  let(:user_id) { users.first.id }

  path '/api/v1/users' do

    get('list users') do
      tags 'Users'
      produces 'application/json'

      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:examples] = { 'application/json' => JSON.parse(response.body, symbolize_names: true) }
        end
        run_test!
      end
    end

    post('create user') do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :user, in: :body, required: true, schema: {
        type: :object,
        required: %i[username password],
        properties: {
          username: { type: :string },
          password: { type: :string }
        }
      }

      response(201, 'successful') do
        let(:user) { { username: "jqpublic23", password: "mypasswd"}}

        after do |example|
          example.metadata[:response][:examples] = { 'application/json' => JSON.parse(response.body, symbolize_names: true) }
        end
        run_test!
      end
    end
  end

  path '/api/v1/users/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show user') do
      tags 'Users'
      response(200, 'successful') do
        let(:id) { user_id }

        after do |example|
          example.metadata[:response][:examples] = { 'application/json' => JSON.parse(response.body, symbolize_names: true) }
        end
        run_test!
      end
    end

    patch('update user') do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string },
          password: { type: :string }
        }
      }
      response(200, 'successful') do
        let(:id) { user_id }
        let(:user) {{username: 'fred'}}
        after do |example|
          example.metadata[:response][:examples] = { 'application/json' => JSON.parse(response.body, symbolize_names: true) }
        end
        run_test!
      end
    end

    put('update user') do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string },
          password: { type: :string }
        }
      }
      response(200, 'successful') do
        let(:id) { user_id }
        let(:user) {{username: 'fred'}}

        after do |example|
          example.metadata[:response][:examples] = { 'application/json' => JSON.parse(response.body, symbolize_names: true) }
        end
        run_test!
      end
    end

    delete('delete user') do
      tags 'Users'
      response(200, 'successful') do
        let(:id) { user_id }

        after do |example|
          example.metadata[:response][:examples] = { 'application/json' => JSON.parse(response.body, symbolize_names: true) }
        end
        run_test!
      end
    end
  end
end
