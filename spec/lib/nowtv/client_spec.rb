# -*- coding: utf-8 -*-
require 'spec_helper'
require 'webmock/rspec'

WebMock.allow_net_connect!

API_URL = 'http://asp.tvguide.or.jp/api/broadcasting?region_code='
REGION_URL = 'http://asp.tvguide.or.jp/api/regions'

module Nowtv
  describe Client do
    before(:all) do
      load File.expand_path("../../fixtures/fixtures.rb", __dir__)
      @client = Nowtv::Client.new
      @valid_region_code = 'tokyo'
      @valid_region_name = '東京'
      @invalid_region_code = 'nihon'
      @invalid_region_name = '日本'
    end

    before do
      stub_request(:get, API_URL + @valid_region_code)
        .to_return(body: EXAMPLE_VALID_PROGRAMS_BODY, status: 200)
      stub_request(:get, API_URL + @invalid_region_code)
        .to_return(body: EXAMPLE_INVALID_PROGRAMS_BODY, status: 200)
      stub_request(:get, REGION_URL).to_return(body: EXAMPLE_REGION_BODY, status: 200)
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
  end
end
