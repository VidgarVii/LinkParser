# frozen_string_literal: true

describe LinkParser::Site, type: :model do
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:status) }
end
