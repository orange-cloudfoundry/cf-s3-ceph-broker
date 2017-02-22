ENV['SETTINGS_PATH'] ||= File.expand_path('../../../settings.yml', __FILE__)

module RiakCsBroker
  class Config < Settingslogic

    source ENV['SETTINGS_PATH']
    load!

    def self.validate!
      # SettingsLogic throws an exception when a setting is accessed, but
      # has not been populated through the yml file.  So, we will just
      # access settings we want to validate and let SettingsLogic trow an exception
      # if a setting is not populated.

      self.ssl_validation
      self.syslog_progname
    end
  end
end
