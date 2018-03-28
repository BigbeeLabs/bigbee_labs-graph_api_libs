require 'rails_helper'

RSpec.describe BigbeeGraph::Person do
  before(:all) do
    @method_name = :groups_for_administrated_organization
    AppCollaborators::Loader.load 'test'
  end
  describe ".search" do
    before(:each) do
      stub_success
    end
    it "responds" do
      expect(graph_person.respond_to?(@method_name)).to be_truthy
    end
    it "does something" do
      graph_person.send(@method_name, graph_organization).tap do |result|
        puts "result:"<<" #{result}".light_blue
      end
    end
    it "does something else" do 
      graph_person.send(@method_name, 58).tap do |result|
        puts "result:"<<" #{result}".light_blue
      end
    end
    it "returns a Hash" do 
      expect(graph_person.send(@method_name, '58')).to be_a(Hash)
    end
    it "Has has an error message" do 
      graph_person.send(@method_name, '58').tap do |result|
        expect(result[:error]).not_to be_nil
      end
    end
  end
end

def do_method
  described_class_using_credential.send @method_name, search_term: ['foo']
end

def described_class_using_credential
  described_class.using_credential({api_key: 'test_foo_api_key'})
end

def stub_person_find_by_sucess
  response = [{id: 1, first_name: 'Foo', last_name: 'Bar'}].to_json
  stub_request(:get, "https://bigbee-graph-staging.herokuapp.com/api/v0/people/search?search_term%5B%5D=foo").
    with(:headers => {'Api-Key'=>'test_foo_api_key'}).
    to_return(:status => 200, :body => response, :headers => {})
end

def stub_success
  response = [{id: 1}]
  stub_request(:get, "https://bigbee-graph-staging.herokuapp.com/api/v0/people/1/administrated_organizations/58/administrated_groups").
    with(  headers: {
      'Token'=>'foo_token'
    }).
    to_return(status: 200, body: JSON.dump(response), headers: {})
  end


def graph_person; @graph_person ||= new_graph_person end

def new_graph_person
  BigbeeGraph::Person.new(id: 1).using_credential(token: 'foo_token')
end

def graph_organization; @graph_organization ||= new_graph_organization end

def new_graph_organization
  BigbeeGraph::Organization.new(id: 58)
end