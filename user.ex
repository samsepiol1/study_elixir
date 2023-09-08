case user do
  %User{is_active: true} -> "Log you in"
  %User(is_active: false) -> "Check your email"
  _others -> "Not a User"
end

# Com clásula

with {:ok, user} <- create_user(params) do
  # Your code here
end


# Função
def is_admin(%User{role:"admin"}),do: true

def is_admin(%User{role: _}), do: false

def is_admin(_) do: raise "Not a User"

def can_access(%User{paid_user:true}), do: true

#Example of guard and pattern Matching

def can_access?(%User{level: level}) when level > 25 do: true
