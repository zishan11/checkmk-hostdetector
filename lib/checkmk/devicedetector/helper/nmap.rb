# -*- coding: UTF-8; -*-
# vim:set fileencoding=UTF-8:

require 'checkmk/devicedetector/helper'

module CheckMK
  module DeviceDetector
    module Helper
      module Nmap
        def self.ping(target, options = [])
          self.scan(target, ['-sP'] + options)
        end

        def self.scan(target, options = [])
          cmd = (['nmap'] + options + [target.to_s]).flatten
          status, stdout, stderr = Helper.exec(cmd)

          if status != 0
            cmd.reject! { |a| a =~ /-O/ }
            status, stdout, stderr = Helper.exec(cmd)
          end

          stdout.strip.lines.reject { |l| l =~ /Starting nmap.*http:\/\//i }.join('\n')
        end
      end
    end
  end
end