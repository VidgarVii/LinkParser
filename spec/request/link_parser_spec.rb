# frozen_string_literal: true

describe 'LinkParser::Application', type: :request do
  include_context 'shared_env'

  subject { LinkParser::Application.instance }
  it 'should return status 404 if not valid router' do
    expect(subject.call(shared_env).first).to eq 404
  end

  it 'should return status 200 if valid router' do
    expect(subject.call(shared_valid_env).first).to eq 200
  end
end
