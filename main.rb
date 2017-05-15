require_relative 'lib/runner'

runner = Runner.new

while input = gets.chomp
  runner.execute(input)
end
