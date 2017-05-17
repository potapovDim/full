export const landingMainPage = {
  userLogin                             : 'a[title="Log in"]', //top right login
  userSignUp                            : 'a[title="Sign up"]', //top right sign up
  getStartedButton                      : 'a[title="Get started"]', //centered button get starter
  signUpAndFreeTrial                    : 'a[title="Sign up and start trial now"]', //low centered button signup and start free trial
  footerListItem                        : '.footer-list__item', // footer list items
  headerAboutUs                         : 'a[title="About us"]', //header About us link
  headerConcepts                        : 'a[title="Concepts"]', //header Concepts link
  headerPricing                         : 'a[title="Pricing"]' //header Pricing link
}

export const loginModal = {
  emailInput                            : 'input#id5', //user email input
  passwordInput                         : 'input#id9', //user email input
  loginSubmitButton                     : 'button[title="Login"]', //login submit button
  alarmMessage                          : '.icon.icon_alarm.icon_absolute_right' // if something wrong alarm message selector
}

export const pricingPage = {
  buyGrowthPlan                         : 'a[title="Buy growth plan"]', // 0 green button , 1 test plan , 2 monthy , 4 annually
  planFeature                           : '.plan__feature', // Moneyback guarantee ; 14 days for free
}

export const signUp = {
  emailInput                            : 'input[name="email"]', //sign up modal email input
  nameInput                             : 'input[name="name"]', //sign up modal name input
  passwordInput                         : 'input[name="password"]', //sign up modal password input
  submitSignUpButton                    : 'button[type="submit"]', //sign up submit button
  acceptTermsCheckbox                   : '#terms', //weblium company terms 
  captchaCheckbox                       : '.recaptcha-checkbox-checkmark' //google recaptcha checkbox
}

export const landingFooterPart = {
  //footer list links
  pricingLink                           : 'a[href="/pricing"]',
  conceptsLink                          : 'a[href="/concepts"]',
  abouLink                              : 'a[href="/about"]',
  blogLink                              : 'a[href="http://blog.weblium.com/"]',
  facebookLink                          : 'a[href="https://www.facebook.com/weblium/"]',
  twitterLink                           : 'a[href="https://twitter.com/WebliumTeam"]',
  linkedinLink                          : 'a[href="https://www.linkedin.com/company-beta/17969770/"]',
  privatePolicy                         : 'a[href="/policy"]',
  termsOfUse                            : 'a[href="/terms"]'
}

export const account = {
  myProfile                             :'a[href="/myaccount/account/profile"]', //open my profile modal 
  myWebsites                            :'a[href="/myaccount/account/websites"]' //open my websites list
}

export const myProfile = {
  //pesonal information
  firstUserName                         : 'input[name="sign-up-name"]', // first name input
  lastUserName                          : 'input[name="sign-up-l-name"]', //last name input
  pfoneUserName                         : 'input[name="phone-num"]', // phone number input
  streetUserAddress1                    : 'input[name="address-1"]', // address 1 input
  streetUserAddress2                    : 'input[name="address-2"]', // address 2 input
  cityName                              : 'input[name="city"]', // city input
  regionName                            : 'input[name="region"]', // region input
  zipCode                               : 'input[name="zip"]', // zip code input
  countryOpenList                       : '#country', // country (open list)
  countryListOption                     : 'option', // country list selection
  dataFormRow                           : '.row-form' // data form row
  // change passwrod
}