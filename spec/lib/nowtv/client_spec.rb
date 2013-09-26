# -*- coding: utf-8 -*-
require 'spec_helper'
require 'webmock/rspec'

WebMock.allow_net_connect!

API_URL = 'http://asp.tvguide.or.jp/api/broadcasting?ccode=goo&region_code='
REGION_URL = 'http://asp.tvguide.or.jp/api/regions?ccode=goo'

module Nowtv
  describe Client do
    before(:all) do
      @client = Nowtv::Client.new
      @valid_region_code = 'tokyo'
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
      it { should be_instance_of Array }
      it 'should be equal to example data' do
        should eql EXAMPLE_REGION_LIST
      end
    end
  end
end



EXAMPLE_VALID_PROGRAMS_BODY = <<-EOS
({"error":0,"ccode":"goo","region_code":"tokyo","media":{"code":"02","name":"\u5730\u4e0a\u6ce2"},"region":{"code":"tokyo","name":"\u6771\u4eac"},"programs":[{"station_code":"02-*01","station_name":"NHK\u7dcf\u5408","start":"201309131930","end":"201309131955","title":"\u7279\u5831\u9996\u90fd\u570f"},{"station_code":"02-#01","station_name":"NHK E\u30c6\u30ec","start":"201309131925","end":"201309131948","title":"\u8ab2\u5916\u6388\u696d\u3000\u3088\u3046\u3053\u305d\u5148\u8f29\u30fb\u9078"},{"station_code":"02-NTV","station_name":"\u65e5\u672c\u30c6\u30ec\u30d3","start":"201309131900","end":"201309132054","title":"\u7dca\u6025\u51fa\u52d5\uff01\u9003\u8d70\u8eca\u3092\u8ffd\u3048\uff01\u4ea4\u901a\u8b66\u5bdf\u3000\u771f\u590f\u306e\u5927\u635c\u67fb\u7dda"},{"station_code":"02-EX ","station_name":"\u30c6\u30ec\u30d3\u671d\u65e5","start":"201309131900","end":"201309131954","title":"\u30c9\u30e9\u3048\u3082\u3093\u8a95\u751f\u65e5\uff11\u6642\u9593\u30b9\u30da\u30b7\u30e3\u30eb"},{"station_code":"02-TBS","station_name":"TBS\u30c6\u30ec\u30d3","start":"201309131900","end":"201309131956","title":"\u7206\u5831\uff01\uff34\uff28\uff25\u3000\u30d5\u30e9\u30a4\u30c7\u30fc"},{"station_code":"02-TX ","station_name":"\u30c6\u30ec\u30d3\u6771\u4eac","start":"201309131830","end":"201309131950","title":"\u304a\u91d1\u304c\u306a\u304f\u3066\u3082\u5e78\u305b\u30e9\u30a4\u30d5\u3000\u304c\u3093\u3070\u308c\u30d7\u30a2\u30fc\u30ba\uff01"},{"station_code":"02-CX","station_name":"\u30d5\u30b8\u30c6\u30ec\u30d3","start":"201309131900","end":"201309131957","title":"\u30da\u30b1\u30dd\u30f3"},{"station_code":"02-MX ","station_name":"TOKYO MX","start":"201309131930","end":"201309132000","title":"\u3081\u305e\u3093\u4e00\u523b"},{"station_code":"02-HDT","station_name":"\u653e\u9001\u5927\u5b66\u30c6\u30ec\u30d3","start":"201309131900","end":"201309131945","title":"\u6587\u5316\u4eba\u985e\u5b66\u7b2c\uff11\uff11\u56de"}]})
EOS

EXAMPLE_INVALID_PROGRAMS_BODY = <<-EOS
({"error":0,"ccode":"goo","region_code":"aaa","media":{"code":"02","name":"\u5730\u4e0a\u6ce2"},"region":{"code":null,"name":null},"programs":[]})
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
   {station: "NHK総合", title: "特報首都圏", start_time: "19:30", end_time: "19:55"},
   {station: "NHK Eテレ", title: "課外授業 ようこそ先輩・選", start_time: "19:25", end_time: "19:48"},
   {station: "日本テレビ", title: "緊急出動！逃走車を追え！交通警察 真夏の大捜査線", start_time: "19:00", end_time: "20:54"},
   {station: "テレビ朝日", title: "ドラえもん誕生日１時間スペシャル", start_time: "19:00", end_time: "19:54"},
   {station: "TBSテレビ", title: "爆報！ＴＨＥ フライデー", start_time: "19:00", end_time: "19:56"},
   {station: "テレビ東京", title: "お金がなくても幸せライフ がんばれプアーズ！", start_time: "18:30", end_time: "19:50"},
   {station: "フジテレビ", title: "ペケポン", start_time: "19:00", end_time: "19:57"},
   {station: "TOKYO MX", title: "めぞん一刻", start_time: "19:30", end_time: "20:00"},
   {station: "放送大学テレビ", title: "文化人類学第１１回", start_time: "19:00", end_time: "19:45"}
  ]

EXAMPLE_REGION_BODY = <<-EOS
({"error":0,"ccode":"goo","media_code":null,"regions":[{"code":"hokk","name":"\u5317\u6d77\u9053","pack_code":null},{"code":"aomori","name":"\u9752\u68ee","pack_code":null},{"code":"iwate","name":"\u5ca9\u624b","pack_code":null},{"code":"miya","name":"\u5bae\u57ce","pack_code":null},{"code":"akita","name":"\u79cb\u7530","pack_code":null},{"code":"yamagata","name":"\u5c71\u5f62","pack_code":null},{"code":"fuku","name":"\u798f\u5cf6","pack_code":null},{"code":"ibaraki","name":"\u8328\u57ce","pack_code":null},{"code":"tochigi","name":"\u6803\u6728","pack_code":null},{"code":"gunma","name":"\u7fa4\u99ac","pack_code":null},{"code":"saitama","name":"\u57fc\u7389","pack_code":null},{"code":"chiba","name":"\u5343\u8449","pack_code":null},{"code":"tokyo","name":"\u6771\u4eac","pack_code":null},{"code":"kanagawa","name":"\u795e\u5948\u5ddd","pack_code":null},{"code":"niigata","name":"\u65b0\u6f5f","pack_code":null},{"code":"toyama","name":"\u5bcc\u5c71","pack_code":null},{"code":"ishikawa","name":"\u77f3\u5ddd","pack_code":null},{"code":"fukui","name":"\u798f\u4e95","pack_code":null},{"code":"yamanasi","name":"\u5c71\u68a8","pack_code":null},{"code":"nagano","name":"\u9577\u91ce","pack_code":null},{"code":"gifu","name":"\u5c90\u961c","pack_code":null},{"code":"sizu","name":"\u9759\u5ca1","pack_code":null},{"code":"aichi","name":"\u611b\u77e5","pack_code":null},{"code":"mie","name":"\u4e09\u91cd","pack_code":null},{"code":"siga","name":"\u6ecb\u8cc0","pack_code":null},{"code":"kyoto","name":"\u4eac\u90fd","pack_code":null},{"code":"osaka","name":"\u5927\u962a","pack_code":null},{"code":"hyougo","name":"\u5175\u5eab","pack_code":null},{"code":"nara","name":"\u5948\u826f","pack_code":null},{"code":"wakayama","name":"\u548c\u6b4c\u5c71","pack_code":null},{"code":"tottori","name":"\u9ce5\u53d6","pack_code":null},{"code":"shimane","name":"\u5cf6\u6839","pack_code":null},{"code":"okayama","name":"\u5ca1\u5c71","pack_code":null},{"code":"hirosima","name":"\u5e83\u5cf6","pack_code":null},{"code":"yamagchi","name":"\u5c71\u53e3","pack_code":null},{"code":"tokusima","name":"\u5fb3\u5cf6","pack_code":null},{"code":"kagawa","name":"\u9999\u5ddd","pack_code":null},{"code":"ehime","name":"\u611b\u5a9b","pack_code":null},{"code":"kouchi","name":"\u9ad8\u77e5","pack_code":null},{"code":"fukuoka","name":"\u798f\u5ca1","pack_code":null},{"code":"saga","name":"\u4f50\u8cc0","pack_code":null},{"code":"nagasaki","name":"\u9577\u5d0e","pack_code":null},{"code":"kumamoto","name":"\u718a\u672c","pack_code":null},{"code":"oita","name":"\u5927\u5206","pack_code":null},{"code":"miyazaki","name":"\u5bae\u5d0e","pack_code":null},{"code":"kagosima","name":"\u9e7f\u5150\u5cf6","pack_code":null},{"code":"nawa","name":"\u6c96\u7e04","pack_code":null}]})
EOS

EXAMPLE_REGION_LIST =
  [
   {:name=>"北海道", :code=>"hokk"},
   {:name=>"青森", :code=>"aomori"},
   {:name=>"岩手", :code=>"iwate"},
   {:name=>"宮城", :code=>"miya"},
   {:name=>"秋田", :code=>"akita"},
   {:name=>"山形", :code=>"yamagata"},
   {:name=>"福島", :code=>"fuku"},
   {:name=>"茨城", :code=>"ibaraki"},
   {:name=>"栃木", :code=>"tochigi"},
   {:name=>"群馬", :code=>"gunma"},
   {:name=>"埼玉", :code=>"saitama"},
   {:name=>"千葉", :code=>"chiba"},
   {:name=>"東京", :code=>"tokyo"},
   {:name=>"神奈川", :code=>"kanagawa"},
   {:name=>"新潟", :code=>"niigata"},
   {:name=>"富山", :code=>"toyama"},
   {:name=>"石川", :code=>"ishikawa"},
   {:name=>"福井", :code=>"fukui"},
   {:name=>"山梨", :code=>"yamanasi"},
   {:name=>"長野", :code=>"nagano"},
   {:name=>"岐阜", :code=>"gifu"},
   {:name=>"静岡", :code=>"sizu"},
   {:name=>"愛知", :code=>"aichi"},
   {:name=>"三重", :code=>"mie"},
   {:name=>"滋賀", :code=>"siga"},
   {:name=>"京都", :code=>"kyoto"},
   {:name=>"大阪", :code=>"osaka"},
   {:name=>"兵庫", :code=>"hyougo"},
   {:name=>"奈良", :code=>"nara"},
   {:name=>"和歌山", :code=>"wakayama"},
   {:name=>"鳥取", :code=>"tottori"},
   {:name=>"島根", :code=>"shimane"},
   {:name=>"岡山", :code=>"okayama"},
   {:name=>"広島", :code=>"hirosima"},
   {:name=>"山口", :code=>"yamagchi"},
   {:name=>"徳島", :code=>"tokusima"},
   {:name=>"香川", :code=>"kagawa"},
   {:name=>"愛媛", :code=>"ehime"},
   {:name=>"高知", :code=>"kouchi"},
   {:name=>"福岡", :code=>"fukuoka"},
   {:name=>"佐賀", :code=>"saga"},
   {:name=>"長崎", :code=>"nagasaki"},
   {:name=>"熊本", :code=>"kumamoto"},
   {:name=>"大分", :code=>"oita"},
   {:name=>"宮崎", :code=>"miyazaki"},
   {:name=>"鹿児島", :code=>"kagosima"},
   {:name=>"沖縄", :code=>"nawa"}
  ]
