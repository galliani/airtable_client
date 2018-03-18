RSpec.describe Airtable::API do
  before do
    @keys = Airtable::Configuration::VALID_OPTIONS_KEYS
  end

  context "with module configuration" do

    before do
      Airtable.configure do |config|
        @keys.each do |key|
          config.send("#{key}=", key)
        end
      end
    end

    after do
      Airtable.reset
    end

    it "should inherit module configuration" do
      api = Airtable::API.new
      @keys.each do |key|
        expect( api.send(key) ).to eq key
      end
    end

    context "with class configuration" do

      before do
        @configuration = {
          endpoint: 'https://api.airtable.com/',
          api_version: 'v0',
          api_key: 'mockedapikey',
          base_uid: 'mockedbaseuid'
        }
      end

      context "during initialization"

        it "should override module configuration" do
          api = Airtable::API.new(@configuration)
          @keys.each do |key|
            expect( api.send(key) ).to eq @configuration[key]
          end
        end

      context "after initilization" do

        let(:api) { Airtable::API.new }

        before do
          @configuration.each do |key, value|
            api.send("#{key}=", value)
          end
        end

        it "should override module configuration after initialization" do
          @keys.each do |key|
            expect( api.send(key) ).to eq @configuration[key]
          end
        end
      end
    end
  end

  describe '#config' do
    subject { Airtable::API.new }

    let(:config) do
      c = {}; @keys.each {|key| c[key] = key }; c
    end

    it "returns a hash representing the configuration" do
      @keys.each do |key|
        subject.send("#{key}=", key)
      end
      expect( subject.config ).to eq config
    end
  end
end