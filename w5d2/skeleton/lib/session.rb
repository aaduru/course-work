require 'json'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    rails_app_cookie = req.cookies["_rails_lite_app"]
    if rails_app_cookie
      deserialized_cookie = JSON.parse(rails_app_cookie)
    end

    if deserialized_cookie
      @value = deserialized_cookie
    else
      @value = {}
    end
  end

  def [](key)
    @value[key]
  end

  def []=(key, val)
    @value[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    cookie_value = @value.to_json
    cookie_path = "/"
    res.set_cookie("_rails_lite_app", { :path => cookie_path, :value => cookie_value } )
  end
end
