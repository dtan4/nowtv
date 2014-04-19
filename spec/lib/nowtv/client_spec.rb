# -*- coding: utf-8 -*-
require 'spec_helper'
require 'webmock/rspec'

WebMock.allow_net_connect!

API_URL = 'http://www.tvguide.or.jp/TXML301PG.php?type=TVG&regionId='

module Nowtv
  describe Client do
    load File.expand_path("../../fixtures/fixtures.rb", __dir__)

    let(:client) { Nowtv::Client.new }
    let(:valid_region_code) { 13 }
    let(:invalid_region_code) { "tokyo" }

    before do
      stub_request(:get, API_URL + valid_region_code.to_s)
        .to_return(body: VALID_PROGRAMS_BODY, status: 200)
      stub_request(:get, API_URL + invalid_region_code.to_s)
        .to_return(body: INVALID_PROGRAMS_BODY, status: 200)
    end

    describe '#get_program_list' do
      context 'with valid region code' do
        let(:program_list) { client.get_program_list(valid_region_code) }

        it "should be Array" do
          expect(program_list).to be_a Array
        end

        it "should be return program list" do
          expect(program_list).to be_eql PROGRAM_LIST
        end
      end

      context 'with invalid region code' do
        it 'should put error message in STDERR' do
          expect do
            client.get_program_list(invalid_region_code)
          end.to raise_error ParseError, "Failed to parse program data"
        end
      end
    end
  end
end
