set :output, "/home/andrii/work/test-task-new/log/cron.log"
set :environment, 'development'
every 1.minute do
  runner "Post.delete_shared_urls"
end
