# -*- coding: utf-8 -*-
require 'json'
require 'open-uri'
require 'time'
require 'nkf'

module Nowtv
  class Client
    API_URL = 'http://www.tvguide.or.jp/TXML301PG.php?type=TVG&regionId='
    REGION_URL = 'http://asp.tvguide.or.jp/api/regions'

    def get_program_list(region_id)
      programs = get_programs(region_id)
      restruct_program_list(programs)
    rescue
      raise ParseError, "Failed to parse program data"
    end

    private

    def get_programs(region_id)
      url = API_URL + region_id.to_s
      JSON.parse(open(url).read)["ProgramScheduleInfomartion"]["MediaLocation"]["StationLocation"]
    end

    def restruct_program_list(programs)
      programs.map do |program|
        info = program["ProgramInformation"]

        {
          station: half_width(program["stationDispName"]),
          title: half_width(info["programTitle"]),
          start_time: Time.parse(info["startDateTime"]),
          end_time: Time.parse(info["endDateTime"])
        }
      end
    end

    def half_width(str)
      NKF.nkf("-wZ0", str).gsub("　", " ")
    end
  end

  class ParseError < StandardError; end
end
