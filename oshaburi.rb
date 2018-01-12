# -*- coding: utf-8 -*-
require_relative 'model/user'
require_relative 'model/message'

Plugin.create(:oshaburi) do
  tab(:oshaburi_test, "おしゃぶり") do
    timeline :oshaburi_test
  end

  Delayer.new do
    File.open(File.join(__dir__, 'test.oshaburi')) do |istream|
      timeline(:oshaburi_test) << istream.map do |json_str|
        Plugin::Oshaburi::Message.new(
          JSON.parse(
            json_str,
            symbolize_names: true
          )
        )
      end
    end
  end
end

