require 'rails_helper'

RSpec.describe BigbeeGraph::Person do
  before(:all) do
    @method_name = "find"
    AppCollaborators::Loader.load 'test'
  end
  describe "#find" do
    before(:each) do
      stub_person_find_by_sucess
    end
    it "responds" do
      expect(described_class_using_credential.respond_to?(@method_name)).to be_truthy
    end
    it "does something" do
      do_method.tap do |returned|
        expect(returned.is_a?(BigbeeGraph::Person)).to be_truthy
        expect(returned.respond_to?(:first_name)).to be_truthy
        expect(returned.respond_to?(:last_name)).to be_truthy
        expect(returned.respond_to?(:id)).to be_truthy
      end
    end
  end
end

def do_method
  described_class_using_credential.send @method_name, 1
end

def described_class_using_credential
  described_class.using_credential({api_key: 'test_foo_api_key'})
end

def stub_person_find_by_sucess
  response = {id: 1, first_name: 'Foo', last_name: 'Bar'}.to_json
  stub_request(:get, "https://bigbee-graph-staging.herokuapp.com/api/v0/people/1").
    with(:headers => {'Api-Key'=>'test_foo_api_key'}).
    to_return(:status => 200, :body => response, :headers => {})
end