require 'spec_helper'

module Nowtv
  describe Client do
    before do
      @client = Nowtv::Client.new
      @region_code = 'tokyo'
    end

    describe '#get_programs' do
      context 'when valid region code is given' do
        before do
          @programs = @client.get_programs(@region_code)
        end

        it 'should return Array' do
          @programs.should be_instance_of Array
        end
      end
    end

    describe '#get_program_list' do

    end
  end
end
