difficulty 3

description "A file has been modified, but you don't want to keep the files.  Checkout the `config.rb` file from the last commit."

setup do
  repo.init
  File.open("config.rb", "w") do |file|
    file.puts("This is the initial config file")
  end

  %w{README setup.rb deploy.rb Guardfile}.each do |file|
    FileUtils.touch(file)
    repo.add(file)
  end

  repo.add("config.rb")
  repo.commit_all("Added initial files")

  File.open("config.rb", "w") do |file|
    file.puts("This is different than what was in the original config file")
  end

  repo.add("config.rb")
  repo.commit_all("Modified config.rb")
end

solution do
  file = request "What file is in conflict"
  return false unless file == "config.rb"
  true
end

hint do
  puts "You will need to do some research on the rebase flag of the pull command for this one."
end