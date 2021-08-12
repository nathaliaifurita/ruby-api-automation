require 'HTTParty'

describe 'get' do
  context 'contacts' do
    it 'returns a list of contacts' do
      response = HTTParty.get('https://api-de-tarefas.herokuapp.com/contacts')
      expect(response.code).to eq 200
      expect(response.message).to eql 'OK'
    end
  end
end