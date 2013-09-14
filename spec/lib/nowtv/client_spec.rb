require 'spec_helper'

module Nowtv
  describe Client do
    before do
      @client = Nowtv::Client.new
      @valid_region_code = 'tokyo'
      @invalid_region_code = 'nihon'
    end

    describe '#get_programs' do
      context 'when valid region code is given' do
        before do
          @programs = @client.get_programs(@valid_region_code)
        end

        it 'should return Array' do
          @programs.should be_instance_of Array
        end

        it 'should have at least one item' do
          @programs.should have_at_least(1).items
        end
      end

      context 'when invalid region code is given' do
        before do
          @programs = @client.get_programs(@invalid_region_code)
        end

        it 'should return Array' do
          @programs.should be_instance_of Array
        end

        it 'should be empty' do
          @programs.should have(0).items
        end
      end
    end

    describe '#get_program_list' do

    end
  end
end
