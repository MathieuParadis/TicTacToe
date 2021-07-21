require 'bundler'
Bundler.require

local_dir =File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(local_dir)

require 'application'
require 'show'
require 'game'
require 'player'
require 'board'
require 'board_cell'

appli = Application.new

