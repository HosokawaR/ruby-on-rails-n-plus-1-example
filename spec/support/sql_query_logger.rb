module SqlQueryLogger
  def log_and_warn_n_plus_one
    queries = []
    subscriber = ActiveSupport::Notifications.subscribe("sql.active_record") do |*args|
      queries << args.last[:sql] unless args.last[:sql].include?("SHOW search_path")
    end

    yield

    ActiveSupport::Notifications.unsubscribe(subscriber)
    puts "\nExecuted SQL queries:"
    queries.each_with_index do |query, index|
      puts "#{index + 1}. #{query}"
    end

    puts "\nTotal queries: #{queries.count}"

    if queries.count > 2
      warn "\e[1;31;43m[Warning] N+1 Queries！\e[0m"
    else
      puts "\e[1;32;40m[Success] No N+1 Queries！\e[0m"
    end
  end
end
