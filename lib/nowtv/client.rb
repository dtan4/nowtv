# -*- coding: utf-8 -*-
require 'json'
require 'open-uri'
require 'time'

module Nowtv
  class Client
    API_URL = 'http://asp.tvguide.or.jp/api/broadcasting?ccode=goo&region_code='
    REGION_URL = 'http://asp.tvguide.or.jp/api/regions?ccode=goo'

    def get_program_list(region_code)
      programs = get_programs(region_code)

      unless programs.length > 1
        $stderr.puts 'Failed to get programs!'
      end

      restruct_program_list(programs)
    end

    def get_programs(region_code)
      url = API_URL + region_code
      JSON.parse(open(url).read.sub(/^\(/, '').sub(/\)$/, ''))['programs']
    rescue ParseError
      []
    end

    def restruct_program_list(programs)
      programs.map do |program|
        {
          station: program["station_name"],
          title: program["title"].gsub('　', ' '), # replace full-width space to half-width space
          start: Time.parse(program["start"]).strftime("%H:%M"),
          end: Time.parse(program["end"]).strftime("%H:%M")
        }
      end
    end

    def get_region_list
      regions = JSON.parse(open(REGION_URL).read.sub(/^\(/, '').sub(/\)$/, ''))['regions']
      regions.map do |region|
        {
          name: region['name'],
          code: region['code']
        }
      end
    rescue ParseError
      []
    end
  end
end
