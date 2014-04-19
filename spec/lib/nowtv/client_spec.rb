# -*- coding: utf-8 -*-
require 'spec_helper'
require 'webmock/rspec'

WebMock.allow_net_connect!

API_URL = 'http://www.tvguide.or.jp/TXML301PG.php?type=TVG&regionId='

module Nowtv
  describe Client do
    before(:all) do
      load File.expand_path("../../fixtures/fixtures.rb", __dir__)
      @client = Nowtv::Client.new
      @valid_region_code = 13
      @invalid_region_code = 'tokyo'
    end

    before do
      stub_request(:get, "#{API_URL}#{@valid_region_code}")
        .to_return(body: EXAMPLE_VALID_PROGRAMS_BODY, status: 200)
      stub_request(:get, "#{API_URL}#{@invalid_region_code}")
        .to_return(body: EXAMPLE_INVALID_PROGRAMS_BODY, status: 200)
    end

    describe '#get_program_list' do
      context 'with valid region code' do
        subject { @client.get_program_list(@valid_region_code) }
        it { should be_instance_of Array }
        it 'should be equal to example data' do
          should eql EXAMPLE_RESTRUCTED_PROGRAMS
        end
      end

      context 'with invalid region code' do
        it 'should put error message in STDERR' do
          expect do
            @client.get_program_list(@invalid_region_code)
          end.to raise_error ParseError, "Failed to parse program data"
        end
      end
    end
  end
end
