require 'rails_helper'

RSpec.describe Event, type: :model do
  it { should validate_presence_of(:sid) }
  it { should validate_presence_of(:cid) }
  it { should validate_presence_of(:signature) }
  it { should validate_presence_of(:signature_gen) }
  it { should validate_presence_of(:signature_id) }
  it { should validate_presence_of(:signature_rev) }
  it { should validate_presence_of(:unified_event_id) }
  it { should validate_presence_of(:unified_event_ref) }
end
