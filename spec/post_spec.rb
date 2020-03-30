describe "post" do
  context "When new user" do
    before do
      @new_user = build(:user).to_hash

      @result = HTTParty.post("http://192.168.56.1:3001/user", body: @new_user.to_json,
                                                               headers: { "Content-Type" => "application/json" })
    end

    it { expect(@result.response.code).to eql "200" }
  end
end
