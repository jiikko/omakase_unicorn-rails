app_root_path = "{{root_path}}"

worker_processes 4
working_directory app_root_path
listen "/tmp/.{{sock_name}}", :backlog => 256
timeout 90
pid "#{app_root_path}/tmp/pids/unicorn.pid"

stderr_path "#{app_root_path}/log/unicorn.stderr.log"
stdout_path "#{app_root_path}/log/unicorn.stdout.log"

preload_app true
GC.respond_to?(:copy_on_write_friendly=) and
  GC.copy_on_write_friendly = true

check_client_connection false

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!

  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
