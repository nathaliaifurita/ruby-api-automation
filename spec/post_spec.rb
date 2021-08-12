require 'HTTParty'
require 'json'
require 'faker'

describe 'post' do
  context 'create new contacts' do
    it 'returns a created contact' do
      @body ={
        "name" => Faker::Movies::HarryPotter.character,
        "last_name" => Faker::Movies::HarryPotter.house,
        "email" => Faker::Internet.email,
        "age" => Faker::Number.between(from: 1, to: 99),
        "phone" => Faker::PhoneNumber.cell_phone,
        "address" => Faker::Movies::HarryPotter.location + " Street",
        "state" => Faker::Movies::HarryPotter.location,
        "city" => Faker::Movies::HarryPotter.location
      }

      response = HTTParty.post('https://api-de-tarefas.herokuapp.com/contacts', 
        :body => JSON.dump(@body), 
        :headers => {
          'Content-Type' => 'application/json', 
          'Accept' => 'application/vnd.tasksmanager.v2'
        }
      )
      expect(response.code).to eq 201
      expect(response.message).to eql 'Created'
    end

    it 'returns an invalid email' do
      @body ={
        "name" => Faker::Movies::HarryPotter.character,
        "last_name" => Faker::Movies::HarryPotter.house,
        "email" => "teste",
        "age" => Faker::Number.between(from: 1, to: 99),
        "phone" => Faker::PhoneNumber.cell_phone,
        "address" => Faker::Movies::HarryPotter.location + " Street",
         "state" => Faker::Movies::HarryPotter.location,
         "city" => Faker::Movies::HarryPotter.location
      }

      response = HTTParty.post('https://api-de-tarefas.herokuapp.com/contacts', 
        :body => JSON.dump(@body), 
        :headers => {
          'Content-Type' => 'application/json', 
          'Accept' => 'application/vnd.tasksmanager.v2'
          }
        )
      expect(response.code).to eq 422
      expect(response.message).to eql 'Unprocessable Entity'
      expect(response.parsed_response['errors']['email']) == 'não é válido'
    end

    it 'returns an error for blank email' do
      @body ={
        "name" => Faker::Movies::HarryPotter.character,
        "last_name" => Faker::Movies::HarryPotter.house,
        "email" => "",
        "age" => Faker::Number.between(from: 1, to: 99),
        "phone" => Faker::PhoneNumber.cell_phone,
        "address" => Faker::Movies::HarryPotter.location + " Street",
        "state" => Faker::Movies::HarryPotter.location,
        "city" => Faker::Movies::HarryPotter.location
      }
  
      response = HTTParty.post('https://api-de-tarefas.herokuapp.com/contacts', 
        :body => JSON.dump(@body), 
        :headers => {
          'Content-Type' => 'application/json', 
          'Accept' => 'application/vnd.tasksmanager.v2'
        }
      )
      expect(response.code).to eq 422
      expect(response.message).to eql 'Unprocessable Entity'
      expect(response.parsed_response['errors']['email']) == 'não pode ficar em branco'
    end

    it 'returns an error for blank email' do
      @body ={
        "name" => Faker::Movies::HarryPotter.character,
        "last_name" => Faker::Movies::HarryPotter.house,
        "email" => "nat@gmail.com",
        "age" => Faker::Number.between(from: 1, to: 99),
        "phone" => Faker::PhoneNumber.cell_phone,
        "address" => Faker::Movies::HarryPotter.location + " Street",
        "state" => Faker::Movies::HarryPotter.location,
        "city" => Faker::Movies::HarryPotter.location
      }
            
      response = HTTParty.post('https://api-de-tarefas.herokuapp.com/contacts', 
        :body => JSON.dump(@body), 
        :headers => {
          'Content-Type' => 'application/json', 
          'Accept' => 'application/vnd.tasksmanager.v2'
        }
      )
      expect(response.code).to eq 422
      expect(response.message).to eql 'Unprocessable Entity'
      expect(response.parsed_response['errors']['email']) == 'não pode ficar em branco'
    end
  end
end