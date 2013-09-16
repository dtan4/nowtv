# -*- coding: utf-8 -*-
require 'spec_helper'
require 'webmock/rspec'

WebMock.allow_net_connect!

API_URL = 'http://asp.tvguide.or.jp/api/broadcasting?ccode=goo&region_code='

module Nowtv
  describe Client do
    before(:all) do
      @client = Nowtv::Client.new
      @valid_region_code = 'tokyo'
      @invalid_region_code = 'nihon'
    end

    describe '#get_programs' do
      context 'when valid region code is given' do
        before(:all) do
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
        before(:all) do
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
      context 'when valid region code is given' do
        before do
          stub_request(:get, API_URL + @valid_region_code)
            .to_return(body: VALID_BODY, status: 200)
          @program_list = @client.get_program_list(@valid_region_code)
        end

        it 'should return Array' do
          @program_list.should be_instance_of Array
        end

        it 'should be equal to example data' do
          @program_list.should eql EXAMPLE_RESTRUCTED_PROGRAMS
        end
      end
    end

    describe '#restrct_program_list' do
      before(:all) do
        @restructed = @client.restruct_program_list(EXAMPLE_PROGRAMS)
      end

      it 'should return Array' do
        @restructed.should be_instance_of Array
      end

      it 'should be equal to example data' do
        @restructed.should eql EXAMPLE_RESTRUCTED_PROGRAMS
      end
    end
  end
end



VALID_BODY = <<-EOS
({"error":0,"ccode":"goo","region_code":"tokyo","media":{"code":"02","name":"\u5730\u4e0a\u6ce2"},"region":{"code":"tokyo","name":"\u6771\u4eac"},"programs":[{"station_code":"02-*01","station_name":"NHK\u7dcf\u5408","start":"201309131930","end":"201309131955","title":"\u7279\u5831\u9996\u90fd\u570f"},{"station_code":"02-#01","station_name":"NHK E\u30c6\u30ec","start":"201309131925","end":"201309131948","title":"\u8ab2\u5916\u6388\u696d\u3000\u3088\u3046\u3053\u305d\u5148\u8f29\u30fb\u9078"},{"station_code":"02-NTV","station_name":"\u65e5\u672c\u30c6\u30ec\u30d3","start":"201309131900","end":"201309132054","title":"\u7dca\u6025\u51fa\u52d5\uff01\u9003\u8d70\u8eca\u3092\u8ffd\u3048\uff01\u4ea4\u901a\u8b66\u5bdf\u3000\u771f\u590f\u306e\u5927\u635c\u67fb\u7dda"},{"station_code":"02-EX ","station_name":"\u30c6\u30ec\u30d3\u671d\u65e5","start":"201309131900","end":"201309131954","title":"\u30c9\u30e9\u3048\u3082\u3093\u8a95\u751f\u65e5\uff11\u6642\u9593\u30b9\u30da\u30b7\u30e3\u30eb"},{"station_code":"02-TBS","station_name":"TBS\u30c6\u30ec\u30d3","start":"201309131900","end":"201309131956","title":"\u7206\u5831\uff01\uff34\uff28\uff25\u3000\u30d5\u30e9\u30a4\u30c7\u30fc"},{"station_code":"02-TX ","station_name":"\u30c6\u30ec\u30d3\u6771\u4eac","start":"201309131830","end":"201309131950","title":"\u304a\u91d1\u304c\u306a\u304f\u3066\u3082\u5e78\u305b\u30e9\u30a4\u30d5\u3000\u304c\u3093\u3070\u308c\u30d7\u30a2\u30fc\u30ba\uff01"},{"station_code":"02-CX","station_name":"\u30d5\u30b8\u30c6\u30ec\u30d3","start":"201309131900","end":"201309131957","title":"\u30da\u30b1\u30dd\u30f3"},{"station_code":"02-MX ","station_name":"TOKYO MX","start":"201309131930","end":"201309132000","title":"\u3081\u305e\u3093\u4e00\u523b"},{"station_code":"02-HDT","station_name":"\u653e\u9001\u5927\u5b66\u30c6\u30ec\u30d3","start":"201309131900","end":"201309131945","title":"\u6587\u5316\u4eba\u985e\u5b66\u7b2c\uff11\uff11\u56de"}]})
EOS

EXAMPLE_PROGRAMS =
  [
   {"station_code"=>"02-*01", "station_name"=>"NHK総合", "start"=>"201309131930", "end"=>"201309131955", "title"=>"特報首都圏"},
   {"station_code"=>"02-#01", "station_name"=>"NHK Eテレ", "start"=>"201309131925", "end"=>"201309131948", "title"=>"課外授業　ようこそ先輩・選"},
   {"station_code"=>"02-NTV", "station_name"=>"日本テレビ", "start"=>"201309131900", "end"=>"201309132054", "title"=>"緊急出動！逃走車を追え！交通警察　真夏の大捜査線"},
   {"station_code"=>"02-EX ", "station_name"=>"テレビ朝日", "start"=>"201309131900", "end"=>"201309131954", "title"=>"ドラえもん誕生日１時間スペシャル"},
   {"station_code"=>"02-TBS", "station_name"=>"TBSテレビ", "start"=>"201309131900", "end"=>"201309131956", "title"=>"爆報！ＴＨＥ　フライデー"},
   {"station_code"=>"02-TX ", "station_name"=>"テレビ東京", "start"=>"201309131830", "end"=>"201309131950", "title"=>"お金がなくても幸せライフ　がんばれプアーズ！"},
   {"station_code"=>"02-CX", "station_name"=>"フジテレビ", "start"=>"201309131900", "end"=>"201309131957", "title"=>"ペケポン"},
   {"station_code"=>"02-MX ", "station_name"=>"TOKYO MX", "start"=>"201309131930", "end"=>"201309132000", "title"=>"めぞん一刻"},
   {"station_code"=>"02-HDT", "station_name"=>"放送大学テレビ", "start"=>"201309131900", "end"=>"201309131945", "title"=>"文化人類学第１１回"}
  ]

EXAMPLE_RESTRUCTED_PROGRAMS =
  [
   {station: "NHK総合", title: "特報首都圏", start: "19:30", end: "19:55"},
   {station: "NHK Eテレ", title: "課外授業 ようこそ先輩・選", start: "19:25", end: "19:48"},
   {station: "日本テレビ", title: "緊急出動！逃走車を追え！交通警察 真夏の大捜査線", start: "19:00", end: "20:54"},
   {station: "テレビ朝日", title: "ドラえもん誕生日１時間スペシャル", start: "19:00", end: "19:54"},
   {station: "TBSテレビ", title: "爆報！ＴＨＥ フライデー", start: "19:00", end: "19:56"},
   {station: "テレビ東京", title: "お金がなくても幸せライフ がんばれプアーズ！", start: "18:30", end: "19:50"},
   {station: "フジテレビ", title: "ペケポン", start: "19:00", end: "19:57"},
   {station: "TOKYO MX", title: "めぞん一刻", start: "19:30", end: "20:00"},
   {station: "放送大学テレビ", title: "文化人類学第１１回", start: "19:00", end: "19:45"}
  ]
