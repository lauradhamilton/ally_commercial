configure :development, :test do
  set :database, 'sqlite://development.db'
end

configure :production do
  # Database connection
  db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

  ActiveRecord::Base.establish_connection(
    :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => "localhost",
    :username => ally_prod,
    :password => password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
  )
end
