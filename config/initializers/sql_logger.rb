ActiveSupport::Notifications.subscribe("sql.active_record") do |*args|
  sql = args.last[:sql]
  Rails.logger.debug "SQL: #{sql}"
end
