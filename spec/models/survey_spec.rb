require 'spec_helper'

describe Survey do
  pending "add some examples to (or delete) #{__FILE__}"

  before (:each) do
    @survey = FactoryGirl.create(:survey)
    @questions = {"A" => "Alice", "B" => "Bob", "E" => "Eve"}
    @non_questions = {}
  end

  describe '#grade' do
    it 'should find the correct version of the master survey' do
    end

    it 'should set the key and correct fields of each question' do
    end

    it 'should grade the overall survey' do
    end

  end
end
