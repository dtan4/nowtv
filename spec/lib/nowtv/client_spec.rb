# -*- coding: utf-8 -*-
require 'spec_helper'
require 'webmock/rspec'

WebMock.allow_net_connect!

API_URL = 'http://asp.tvguide.or.jp/api/broadcasting?ccode=goo&region_code='
REGION_URL = 'http://asp.tvguide.or.jp/api/regions?ccode=goo'

module Nowtv
  describe Client do
    before(:all) do
      load File.expand_path("../../fixtures/fixtures.rb", __dir__)
      @client = Nowtv::Client.new
      @valid_region_code = 'tokyo'
      @valid_region_name = '東京'
      @invalid_region_code = 'nihon'
    end

    before do
      stub_request(:get, API_URL + @valid_region_code)
        .to_return(body: EXAMPLE_VALID_PROGRAMS_BODY, status: 200)
      stub_request(:get, API_URL + @invalid_region_code)
        .to_return(body: EXAMPLE_INVALID_PROGRAMS_BODY, status: 200)
      stub_request(:get, REGION_URL).to_return(body: EXAMPLE_REGION_BODY, status: 200)
    end

    describe '#get_programs' do
      context 'with valid region code' do
        subject { @client.get_programs(@valid_region_code) }
        it { should be_instance_of Array }
        it { should have_at_least(1).items }
      end

      context 'with invalid region' do
        subject { @client.get_programs(@invalid_region_code) }
        it { should be_instance_of Array }
        it { should have(0).items }
      end
    end

    describe '#get_program_list' do
      context 'with valid region code' do
        subject { @client.get_program_list(@valid_region_code) }
        it { should be_instance_of Array }
        it 'should be equal to example data' do
          should eql EXAMPLE_RESTRUCTED_PROGRAMS
        end
      end

      context 'with valid region name' do
        subject { @client.get_program_list(@valid_region_name) }
        it { should be_instance_of Array }
        it 'should be equal to example data' do
          should eql EXAMPLE_RESTRUCTED_PROGRAMS
        end
      end

      context 'with invalid region code' do
        it 'should put error message in STDERR' do
          $stderr.should_receive(:puts).with('Failed to get programs!')
          @program_list = @client.get_program_list(@invalid_region_code)
        end
      end
    end

    describe '#restrct_program_list' do
      subject { @client.restruct_program_list(EXAMPLE_PROGRAMS) }
      it { should be_instance_of Array }
      it 'should be equal to example data' do
        should eql EXAMPLE_RESTRUCTED_PROGRAMS
      end
    end

    describe '#get_region_list' do
      subject { @client.get_region_list }
      it { should be_instance_of Hash }
      it { should have(47).items }
      it 'should be equal to example data' do
        should eq EXAMPLE_REGION_LIST
      end
    end
  end
end
