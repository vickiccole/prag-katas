require 'key.rb'

RSpec.describe Key do

    it 'creates a Key class' do
      key = Key.new("test")
      expect(key).to be_kind_of(Key)
    end    

    it 'creates a key composed of an array containing count of each letter in indexed positions' do
        key = Key.new("abctest")
        expected_output = [1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,0,0,0,0,0,0]
        expect(key.cipher).to eq(expected_output)
    end

end