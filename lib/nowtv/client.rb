# -*- coding: utf-8 -*-
require 'json'
require 'open-uri'
require 'time'
require 'nkf'

module Nowtv
  class Client
    API_URL = 'http://asp.tvguide.or.jp/api/broadcasting?ccode=goo&region_code='
    REGION_URL = 'http://asp.tvguide.or.jp/api/regions?ccode=goo'

    def get_program_list(region_code)
      programs = get_programs(region_code)

      unless programs.length > 1
        region_code_by_name = get_region_list[:"#{region_code}"]

        unless region_code_by_name
          $stderr.puts 'Failed to get programs!'
          return nil
        end

        puts region_code_by_name
        programs = get_programs(region_code_by_name)
      end

      restruct_program_list(programs)
    end

    def get_programs(region_code)
      url = API_URL + region_code
      JSON.parse(open(url).read.sub(/^\(/, '').sub(/\)$/, ''))['programs']
    rescue
      []
    end

    def restruct_program_list(programs)
      programs.map do |program|
        {
          station: NKF.nkf("-wZ0", program["station_name"]),
          title: NKF.nkf("-wZ0", program["title"]).gsub("　", " "),
          start: Time.parse(program["start"]).strftime("%H:%M"),
          end: Time.parse(program["end"]).strftime("%H:%M")
        }
      end
    end

    def get_region_list
      regions = JSON.parse(open(REGION_URL).read.sub(/^\(/, '').sub(/\)$/, ''))['regions']
      result = {}
      regions.each { |region| result[:"#{region["name"]}"] = region["code"] }
      result
    rescue
      []
    end
  end
end
