class ApiUser
  include HTTParty
  base_uri "http://192.168.56.1:3001"
  headers "Content-Type" => "application/json"

  def self.save(user)
    post("/user", body: user.to_json)
  end
end
