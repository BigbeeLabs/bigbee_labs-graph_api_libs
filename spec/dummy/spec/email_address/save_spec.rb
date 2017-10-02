require 'rails_helper'

RSpec.describe BigbeeGraph::EmailAddress do
  before(:all) do
    @method_name = "save"
    AppCollaborators::Loader.load 'test'
  end
  describe "#save" do
    before(:each) do 
      stub_save_success
    end
    it "responds" do
      expect(email_address.respond_to?(@method_name)).to be_truthy
    end
    it "does something" do
      email_address.save
    end
  end
end

def email_address() @email_address ||= new_email_address end

def new_email_address
  BigbeeGraph::EmailAddress.new(id: 1, credential: {token: 'token'}, label: 'foo', address: 'foo@bar.com')
end

def stub_save_success
  resp = {id: 1, label: 'foo', address: 'foo@bar.com'}.to_json
  stub_request(:patch, "https://bigbee-graph-staging.herokuapp.com/api/v0/email_addresses/1?email_address%5Baddress%5D=foo@bar.com&email_address%5Blabel%5D=foo").
    with(headers: {'Token'=>'token'}).
    to_return(status: 200, body: resp, headers: {})
end
