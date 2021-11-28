require 'HTTParty'

describe 'get' do
  context 'contacts' do
    it 'returns a list of contacts' do
      response = HTTParty.get('https://api-de-tarefas.herokuapp.com/contacts/337')
      parsed_response = JSON.parse(response.body)
      expect(response.code).to eq 200
      expect(response.message).to eql 'OK'
      expect(parsed_response['data']['id']).not_to be_empty
      expect(parsed_response['data']['type']).not_to be_empty
      expect(parsed_response['data']['attributes']).not_to be_empty
      expect(parsed_response['data']['attributes']['name']).not_to be_empty
      expect(parsed_response['data']['attributes']['lastname']).not_to be_empty
      expect(parsed_response['data']['attributes']['email']).not_to be_empty
      expect(parsed_response['data']['attributes']['age']).not_to be_empty
      expect(parsed_response['data']['attributes']['phone']).not_to be_empty
      expect(parsed_response['data']['attributes']['address']).not_to be_empty
      expect(parsed_response['data']['attributes']['state']).not_to be_empty
    end
  end
end