require 'rest-client'
require 'json'

def generate_email_prefix
  string_builder = '1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM'
  initial_prefix_email = 
  for i in 0..5 do
    initial_prefix_email += string_builder[rand(0..62)]
  end
  return initial_prefix_email
end

def assert_elasticsearch_run
  RestClient::Request.execute(url: "http://127.0.0.1:9200/",
                          method: :get,
                          headers: {content_type: 'application/json'},
                          verify_ssl: false)
end

def set_token(browser, username, password)

  browser.execute_script("localStorage.setItem('auth','#{get_user_token(username, password).to_json}')")
end

def get_user_token(username, password)
  login_data = JSON.parse(RestClient::Request.execute(url: "#{@base_url}/api/v0.1.0/auth/login",
                                           method: :post,
                                           headers: {content_type: 'application/json'},
                                           payload: {'username' => username, 'password' =>  password }.to_json,
                                           verify_ssl: false))
  return login_data
end
def parse_token (token)
  return JSON.parse(token)
end
def get_user_website_list(token)
    user_website_list = JSON.parse(RestClient::Request.execute(url: "#{@base_url}/api/v0.1.0/websites",
                                           method: :get,
                                           headers: {content_type: 'application/json', authorization: "Bearer #{token}"},
                                           verify_ssl: false))
  return {"websites"=>user_website_list['data'], "user_token" => token}
end

def remove_test_page_from_websites(data_token)
  websites = data_token['websites'].each do |website|
      website_data =  JSON.parse(RestClient::Request.execute(url: "#{@base_url}/api/v0.1.0/website/#{website['_id']}",
                                           method: :get,
                                           headers: {content_type: 'application/json', authorization: "Bearer #{data_token['user_token']}"},
                                           verify_ssl: false))
        website_data['data']['pages'].each do |page|
          page_data = JSON.parse(RestClient::Request.execute(url: "#{@base_url}/api/v0.1.0/website/#{website['_id']}/page/#{page}",
                                            method: :get,
                                            headers: {content_type: 'application/json', authorization: "Bearer #{data_token['user_token']}"},
                                            verify_ssl: false))
          if page_data['data']['metadata']['displayName'] == 'test'
            removed_page_response = JSON.parse(RestClient::Request.execute(url: "#{@base_url}/api/v0.1.0/website/#{website['_id']}/page/#{page}?__v=#{website['__v']}",
                                              method: :delete,
                                              headers: {content_type: 'application/json', authorization: "Bearer #{data_token['user_token']}"},
                                              verify_ssl: false))
        puts removed_page_response
      end                                   
    end
  end
end

# 3 - token, all, need_nine
# 4 - username, pass, all, need_nine
def clear_useless_user_websites(*args)
  if args.length == 3  
    websites_token = get_user_website_list(parse_token(args[0])['token'])
  else
    websites_token = get_user_website_list(get_user_token(args[0], args[1])['token'])
  end
    websites = websites_token['websites']
  token = websites_token['user_token']
  #args[args.length - 1] - need_nine
  if websites.length == 0 
    return 
  elsif args[args.length - 1] && websites.length == 9 
    return 
  end
  if args[args.length - 2] #all
    websites.each do |website|
    remove_body = JSON.parse(RestClient::Request.execute(url: "#{@base_url}/api/v0.1.0/website/#{website['_id']}",
                                           method: :delete,
                                           headers: {content_type: 'application/json', authorization: "Bearer #{token}"},
                                           verify_ssl: false))
    puts remove_body
    end
  end
  remove_body = JSON.parse(RestClient::Request.execute(url: "#{@base_url}/api/v0.1.0/website/#{websites[0]['_id']}",
                                           method: :delete,
                                           headers: {content_type: 'application/json', authorization: "Bearer #{token}"},
                                           verify_ssl: false))
  puts remove_body
end

def clear_useless_user_pages(username, password)
  remove_test_page_from_websites(get_user_website_list(get_user_token(username, password)['token']))
end

def get_published_concepts
  concepts = JSON.parse(RestClient::Request.execute(url: "#{@base_url}/api/concept",
                                           method: :get,
                                           headers: {content_type: 'application/json'},
                                           verify_ssl: false))['data']
  concepts_ids = []
  concepts.each do |concept|
    concepts_ids.push concept['_id']
  end
  return concepts_ids
end
def add_new_website(token)
  first_id = get_published_concepts[0]
  RestClient::Request.execute(url:"#{@base_url}/api/website",
                                                        method: :post,
                                                        headers: {content_type: 'application/json', authorization: "Bearer #{token}"},
                                                        payload: {'concept' => first_id, 'name' =>  "xxx" }.to_json,
                                                        verify_ssl: false)                                  
end
def add_user_website (username, password)
  add_new_website(get_user_token(username,password)['token'])
end
def get_website_number(username, password)
    token = get_user_token(username,password)['token']
    user_website_list = JSON.parse(RestClient::Request.execute(url: "#{@base_url}/api/v0.1.0/websites",
                                           method: :get,
                                           headers: {content_type: 'application/json', authorization: "Bearer #{token}"},
                                           verify_ssl: false))
  return user_website_list['total']
end
def get_first_user_website_id(username, password)
  token = get_user_token(username,password)['token']
  website_id = JSON.parse(RestClient::Request.execute(url: "#{@base_url}/api/v0.1.0/websites",
                                           method: :get,
                                           headers: {content_type: 'application/json', authorization: "Bearer #{token}"},
                                           verify_ssl: false))
  return website_id['data'][0]['_id']
end
