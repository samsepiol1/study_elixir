defmodule Requests do
  # Anon Function to get the request, Mint has a problem because it's to raw, but it's usefuel in some cases


  {:ok, conn} = Mint.HTTP.Connect(:http, "httpbin.org", 80)

  {:ok, conn, request_ref} = Mint.HTTP.request(conn, "GET", "/", [], "")

end
