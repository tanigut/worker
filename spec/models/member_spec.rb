require "rails_helper"

RSpec.describe "Memberモデルのテスト", type: :model do

  describe "バリデーションのテスト" do
    let(:member) { build(:member) }
    subject{ test_member.valid? }
    context "memberカラム" do
    	let(:test_member) { member }
    	it "presence: true(空欄禁止)" do
    		test_member.first_name = ""
    		test_member.last_name = ""
    		test_member.first_name_kana = ""
    		test_member.last_name_kana = ""
    		test_member.company_name = ""
    	end
    end

    #context "company_nameカラム" do
    	#let(:test_member) { member }
    	#it "uniqueness: true(重複禁止)" do
    	    #member = create(:test_member, company_name: test_member.company_name)
    	    #expect(member).not_to be_valid
    	#end
    #end
  end
end


