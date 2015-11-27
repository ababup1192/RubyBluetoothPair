# -*- coding: utf-8 -*-
require 'bluetooth'
require 'socket'

devices = Bluetooth.scan

unless devices.empty? then
  puts 'どの端末とペアリングしますか？'

  # devices.select{|device| device.pair}

  # bluetooth端末一覧を表示
  devices.each_with_index do |device, idx|
    puts "[#{idx}] #{device.name}"
  end

  num = gets.to_i
  device = devices[num]
  unless device.nil? then
    device.pair_confirmation do |number|
      puts "The device should say %06d" % number
      true
    end

    # ペアリング成功
    if device.pair then
       puts device.address
    end
  else
    puts '希望の端末はありませんでした。'
  end

else
  puts 'お近くにBluetooth端末がありません。'
end

