# -*- coding: utf-8 -*-
require 'json'
require 'open-uri'

module Nowtv
  class Client
    API_URL = 'http://asp.tvguide.or.jp/api/broadcasting?ccode=goo&region_code='

    def get_program_list(region_code)
      programs = get_programs(region_code)

      unless programs
        $stderr.puts 'Failed to get programs!'
      end

      restruct_program_list(programs)
    end

    def get_programs(region_code)
      url = API_URL + region_code
      JSON.parse(open(url).read.sub(/^\(/, '').sub(/\)$/, ''))['programs']
    rescue ParseError
      nil
    end

    def restruct_program_list(programs)
      programs.map do |program|
        {
          station: program["station_name"],
          title: program["title"].gsub('　', ' ') # remove full-width space
        }
      end
    end
  end
end
