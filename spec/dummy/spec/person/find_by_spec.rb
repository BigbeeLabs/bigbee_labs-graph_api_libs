require 'rails_helper'

RSpec.describe BigbeeGraph::Person do
  before(:all) do
    @method_name = "find_by"
    AppCollaborators::Loader.load 'test'
  end
  describe "#find_by" do
    before(:each) do
      stub_person_find_by_sucess
    end
    it "responds" do
      expect(described_class_using_credential.respond_to?(@method_name)).to be_truthy
    end
    it "does something" do
      do_method.first.tap do |returned|
        puts "returned.inspect: #{returned.inspect}"
      end
    end
  end
end

def do_method
  described_class_using_credential.send @method_name, id: 1
end

def described_class_using_credential
  described_class.using_credential({api_key: 'test_foo_api_key'})
end

def stub_person_find_by_sucess
  response = {id: 1, first_name: 'Foo', last_name: 'Bar'}.to_json
  stub_request(:get, "https://bigbee-graph-staging.herokuapp.com/api/v0/people?person%5Bid%5D=1").
    with(:headers => {'Api-Key'=>'test_foo_api_key'}).
    to_return(:status => 200, :body => response, :headers => {})
end