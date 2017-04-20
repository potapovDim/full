def generate_email_prefix
  string_builder = '1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM'
  initial_prefix_email = 
  for i in 0..10 do
    initial_prefix_email += string_builder[rand(0..62)]
  end
  return initial_prefix_email
end