require 'rails_helper'

RSpec.describe HbcuSerializer do
  let(:hbcu) { FactoryGirl.create(:hbcu, name: 'University of Meadow Brooks',
                                  street_address: '123 Sesame Street') }

  subject(:serializer) { HbcuSerializer.new(hbcu) }

  describe '#serializable_hash' do
    let(:serialized_hash) { ActiveModelSerializers::Adapter.create(serializer).serializable_hash }

    specify { expect(serialized_hash).to match( { data: {id: hbcu.id.to_s, type: 'hbcus', attributes: {name: 'University of Meadow Brooks', street_address: '123 Sesame Street'}} }) }
  end
end
