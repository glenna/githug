require 'thor'
require 'gitscrub'
module Gitscrub
  class CLI < Thor


    default_task :setup

    desc :setup, "Initialize the game"

    def setup
      UI.word_box("Gitscrub")
      make_directory
      game = Game.new
      game.play_level
    end

    desc :check, "check your current solution"

    def check
      true
    end

    desc :reset, "reset the current level"

    def reset
      true
    end

    no_tasks do

      def make_directory
        unless File.exists?("./git_scrub") || Dir.pwd.split("/").last == "git_scrub"
          if UI.ask("No gitscrubber directory found, do you wish to create one?")
            Dir.mkdir("./git_scrub")
          else
            UI.puts("Exiting")
            exit
          end
        end
      end

    end

  end
end