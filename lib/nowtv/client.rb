# -*- coding: utf-8 -*-
require 'chronic'
require 'json'
require 'nkf'
require 'open-uri'
require 'time'

module Nowtv
  class Client
    API_URL = 'http://www.tvguide.or.jp/TXML301PG.php?type=TVG&regionId='

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
          channel_id: channel_id(program["additionalDisplayChannel"]),
          title: half_width(info["programTitle"]),
          start_time: Chronic.parse(info["startDateTime"]),
          end_time: Chronic.parse(info["endDateTime"])
        }
      end.sort_by { |program| program[:channel_id] }
    end

    def half_width(str)
      NKF.nkf("-wZ0", str).gsub("　", " ")
    end

    def channel_id(display_channel)
      half_width(display_channel).scan(/\d+/).first.to_i
    end
  end

  class ParseError < StandardError; end
end
