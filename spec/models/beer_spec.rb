require 'rails_helper'

RSpec.describe Beer, type: :model do
  describe "with" do
    let(:test_brewery){ Brewery.new name: "Testipanimo", year: 2000 }
    let(:valid_test_beer){ Beer.create name: "Testikalja", style: "Testityyli", brewery: test_brewery }
    let(:noname_test_beer){ Beer.create style: "Testityyli", brewery: test_brewery }
    let(:nostyle_test_beer){ Beer.create name: "Testikalja", brewery: test_brewery }

    it "proper values is saved" do
      expect(valid_test_beer).to be_valid
      expect(Beer.count).to eq(1)
    end

    it "no name is not saved" do
      expect(noname_test_beer).not_to be_valid
      expect(Beer.count).to eq(0)
    end

    it "no style is not saved" do
      expect(nostyle_test_beer).not_to be_valid
      expect(Beer.count).to eq(0)
    end
  end
end
