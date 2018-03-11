RSpec.describe Airtable::Client do
  let(:base_uid) { 'airtablebaseuid' }

  before do
    Airtable.configure do |config|
      config.api_key = "STUBBED_API_KEY"
    end    
  end

  describe '.retrieve_records' do
    let(:table_name) { 'Expense Log' }
    let(:table_name_uri_friendly) { 'Expense%20Log' }

    context 'valid arguments' do
      before do
        @stub = stub_request(:get, Airtable::API_URL + Airtable::API_VERSION + '/' + base_uid + '/' + table_name_uri_friendly).
          to_return(status: 200, body: '{"balance": 1241231}', headers: {})
      end

      it 'should send a GET request to the specified table' do
        client = Airtable.client(base_uid: 'airtablebaseuid', table_name: 'Expense Log')
        client.retrieve_records

        expect(@stub).to have_been_requested
      end
    end

    context 'invalid arguments' do
    end    
  end
end