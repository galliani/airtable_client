RSpec.describe Airtable do
  it 'has a version number' do
    expect(Airtable::VERSION).not_to be nil
  end

  describe '.client' do
    it 'should be a Airtable::Client' do
      expect(Airtable.client).to be_a Airtable::Client
    end
  end

  describe '.configure' do
    it 'should be able to set configuration for the client' do
    	mocked_key = 'VALID_API_KEY'
    	
    	Airtable.configure { |c| c.api_key = mocked_key }

      expect(Airtable.api_key).to eq mocked_key
    end
  end  
end
