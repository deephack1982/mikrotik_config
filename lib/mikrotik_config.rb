require "mikrotik_config/version"
require 'net/ssh'

module MikrotikConfig
  def self.version
    puts MikrotikConfig::VERSION
  end

  def self.testconnect(ip, username, password)
    Net::SSH.start(ip, username, :password => password) do |ssh|
      result = ssh.exec!("nothing")
      puts result
    end
  end

  def self.export(ip, username, password, filename)
    Net::SSH.start(ip, username, :password => password) do |ssh|
      result = ssh.exec!("export")
      File.write(filename, result)
      puts "Config backed up"
    end
  end
end
