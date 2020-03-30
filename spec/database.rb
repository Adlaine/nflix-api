require "pg"

class Database
  def initialize
    conn = { host: "192.168.56.1", dbname: "nflix", user: "postgres", password: "qaninja" } #acesso ao banco de dados
    @connection = PG.connect(conn)
  end

  def delete_user(email)
    @connection.exec("DELETE from public.users where email = '#{email}';")
  end
end
