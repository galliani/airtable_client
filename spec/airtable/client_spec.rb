RSpec.describe Airtable::Client do
  let(:base_uid) { 'airtablebaseuid' }

  before do
    Airtable.configure do |config|
      config.api_key = 'STUBBED_API_KEY'
    end    
  end

  describe '.list_records' do
    let(:table_name) { 'Expense Log' }
    let(:table_name_uri_friendly) { 'Expense%20Log' }

    context 'valid arguments' do
      before do
        data = read_file_fixture('list_records_expense_logs_table.json')
        
        valid_url = Airtable.options[:endpoint] + Airtable.options[:api_version] + 
                    '/' + base_uid + '/' + table_name_uri_friendly
        
        @stub = stub_request(:get, valid_url + '?maxRecords=100').
          to_return(status: 200, body: data, headers: {})
      end

      it 'should send a GET request to the specified table' do
        client = Airtable.client(base_uid: 'airtablebaseuid')
        client.list_records(table_name: 'Expense Log', params: {})

        expect(@stub).to have_been_requested
      end

      it 'should send a GET request to the specified table' do
        client = Airtable.client(base_uid: 'airtablebaseuid')
        
        response = client.list_records(table_name: 'Expense Log', params: {})
        parsed_response = JSON.parse(response)

        expect( parsed_response.keys ).to eq ['records', 'offset']
        expect( parsed_response['records'].first.keys ).to eq ['id', 'fields', 'createdTime']
      end
    end

    context 'invalid arguments' do
      context 'not found table' do
        before do
          @non_existing_table = 'Non Existing Table'
          valid_url = Airtable.options[:endpoint] + Airtable.options[:api_version] + 
                      '/' + base_uid + '/' + URI.escape(@non_existing_table)
          
          @stub = stub_request(:get, valid_url + '?maxRecords=100').
            to_return(
              status: 404, 
              body: '{ "error": 404, "message": "Route or resource is not found." }', 
              headers: {}
            )
        end

        it 'should be returning 404 error' do
          client = Airtable.client(base_uid: 'airtablebaseuid')
          client.list_records(table_name: @non_existing_table, params: {})

          expect(@stub).to have_been_requested
        end        
      end
    end    
  end
end