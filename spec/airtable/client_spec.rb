RSpec.describe Airtable::Client do
  let(:base_uid) { 'airtablebaseuid' }

  before do
    Airtable.configure do |config|
      config.api_key = 'STUBBED_API_KEY'
      config.api_version = 'v0'
    end    
  end

  describe '.list_records' do
    let(:table_name) { 'Expense Log' }
    let(:table_name_uri_friendly) { 'Expense%20Log' }

    context 'valid arguments' do
      before do
        valid_url = Airtable.options[:endpoint] + Airtable.options[:api_version] + 
                    '/' + base_uid + '/' + table_name_uri_friendly
        
        @stub = stub_request(:get, valid_url + '?maxRecords=100').
          to_return(status: 200, body: '{"balance": 1241231}', headers: {})
      end

      it 'should send a GET request to the specified table' do
        client = Airtable.client(base_uid: 'airtablebaseuid')
        client.list_records(table_name: 'Expense Log', params: {})

        expect(@stub).to have_been_requested
      end
    end

    context 'invalid arguments' do
    end    
  end
end