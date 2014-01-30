require 'securerandom'
require 'spec_helper'

describe "Provisioning a Riak CS service instance" do
  let(:instance_id) { SecureRandom.uuid }

  def make_request(id = instance_id)
    put "/v2/service_instances/#{id}"
  end


  it "returns an Unauthorized HTTP response" do
    make_request
    last_response.status.should == 401
  end

  context "when authenticated", :authenticated do
    it "returns a Created HTTP response" do
      make_request
      last_response.status.should == 201
    end

    it "returns an empty JSON object" do
      make_request
      last_response.body.should be_json_eql("{}")
    end

    context "and provisioning an existing instance" do
      it "returns a Conflict HTTP response" do
        make_request
        make_request
        last_response.status.should == 409
      end
    end

    context "when creating the bucket fails" do
      before(:each) do
        RiakCsBroker::ServiceInstances.any_instance.stub(:add).
          and_raise(RiakCsBroker::ServiceInstances::ClientError.new("some-error-message"))
      end

      it "returns a 500 error code" do
        make_request
        last_response.status.should == 500
      end

      it "returns a JSON response containing the error message" do
        make_request
        last_response.body.should be_json_eql({ description: "some-error-message"}.to_json)
      end
    end
  end
end