require 'active_record'

class Subject < ActiveRecord::Base
  establish_connection(:adapter => 'mysql2',
                       :host => 'localhost',
                       :username => 'igordor',
                       :password => 'password',
                       :database => 'simple_cms_development')

  def self.all_subject
    p self.all
  end
end