def generate_email_prefix
  string_builder = '1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM'
  initial_prefix_email = 
  for i in 0..5 do
    initial_prefix_email += string_builder[rand(0..62)]
  end
  return initial_prefix_email
end


require 'rest-client'
require 'json'

def get_user_token(username, password)
  user_token = JSON.parse(RestClient::Request.execute(url: "#{@base_url}/api/v0.1.0/auth/login",
                                           method: :post,
                                           headers: {content_type: 'application/json'},
                                           payload: {'username' => username, 'password' =>  password }.to_json,
                                           verify_ssl: false))['token']
  return user_token
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


def clear_useless_user_websites(username, password, all, need_nine)
  websites_token = get_user_website_list(get_user_token(username, password))
  websites = websites_token['websites']
  token = websites_token['user_token']
  if need_nine && websites.length == 9
    return 
  end
  if all
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
  remove_test_page_from_websites(get_user_website_list(get_user_token(username, password)))
end

