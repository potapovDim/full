require_relative '../../scripts/local.rb'

# , :focus => true if need run only this suit
describe "Leftnav (site structure)" do
  before :each do
    require 'rest-client'
    require 'json'
      def get_user_token
        user_token = JSON.parse(RestClient::Request.execute(url: "#{@base_url}/api/v0.1.0/auth/login",
                                             method: :post,
                                             headers: {content_type: 'application/json'},
                                             payload: {'username' => @username, 'password' =>  @password }.to_json,
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
              puts website
              removed_page_response = JSON.parse(RestClient::Request.execute(url: "#{USER_URL}/api/v0.1.0/website/#{website['_id']}/page/#{page}?__v=#{website['__v']}",
                                             method: :delete,
                                             headers: {content_type: 'application/json', authorization: "Bearer #{data_token['user_token']}"},
                                             verify_ssl: false))
              puts removed_page_response
            end                                   
          end
        end
      end
    remove_test_page_from_websites(get_user_website_list(get_user_token()))
    @browser.window.resize_to 1600, 1200
    @browser.goto @base_url
    @landing.login()
            .login_user(@username, @password) 
            .go_to_my_websites()
            .go_to_editor_from_website(0)
    expect(@browser.url.include?('/editor/website/')).to eql(true)
    @left_nav = LeftNav.new @browser
  end
  it "add new page and delete page" do
    #add page part
    page_length_before, new_page = @left_nav
                                    .open_pages()
                                    .became_to_initial_structure()
                                    .create_new_page()
    page_length_after            =  new_page
                                    .enter_page_name('test')
                                    .enter_page_url('test')
                                    .add_page()
    sleep 2
    expect(page_length_before == page_length_after ).to be true
    #delete page part
    # before_pages, after_pages = @left_nav.open_pages()
    #                                      .delete_page(1)               
    # expect(before_pages != after_pages ).to be true
  end
end