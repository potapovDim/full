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
  passwordInput                         : 'input#id9', //user password input
  loginSubmitButton                     : 'button[title="Login"]', //login submit button
  alarmMessage                          : '.icon.icon_alarm.icon_absolute_right', // if something wrong alarm message selector
  invalidEmailOrPassword                : 'form>span', //if user data invalid
  googleLoginButton                     : '.btn_social_google', //button for open google login
  googlePhoneOrEmailInput               : '#identifierId', //input at google page for email or phone
  nextAtEmail                           : '#identifierNext', //next button
  googlePasswordInput                   : 'input[name="password"]', // password at google page  
  passNext                              : '#passwordNext' //next pass 
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
  myProfile                             :'a[href="/myaccount/profile"]', //open my profile modal 
  myWebsites                            :'a[href="/myaccount/websites"]' //open my websites list
}

export const myProfile = {
  //pesonal information
  firstUserName                         : 'input[name="sign-up-name"]', // first name input
  lastUserName                          : 'input[name="sign-up-l-name"]', //last name input
  phoneUserName                         : 'input[name="phone-num"]', // phone number input
  streetUserAddress1                    : 'input[name="address-1"]', // address 1 input
  streetUserAddress2                    : 'input[name="address-2"]', // address 2 input
  cityName                              : 'input[name="city"]', // city input
  regionStateName                       : 'input[name="region"]', // region input
  zipCode                               : 'input[name="zip"]', // zip code input
  countryOpenList                       : '#country', // country (open list)
  countryListOption                     : 'option', // country list selection
  dataFormRow                           : '.row-form', // data form row
  // change passwrod
  goToChangePasswordModal               : '.text-list__item.text-list__item_md.light.link.bold', //open change password modal
  oldPasswordInput                      : 'input[name="old-pswd"]',
  newPasswordInput                      : 'input[name="new-pswd"]',
  newPasswordConfirmInput               : 'input[name="new-pswd-confirm"]', 
  changePasswordButton                  : '.button.btn.btn_blue.btn_full.btn_sd', // change password form button
  changePasswordButtonProgress          : '.button.btn.btn_blue.btn_full.btn_sd.progress', // change password form button progress
  changePasswordButtonSuccess           : '.button.btn.btn_blue.btn_full.btn_sd.success', // change password form button success
  changePasswordButtonFail              : '.button.btn.btn_blue.btn_full.btn_sd.fail', // change password form button failed
  //email notification
  monthlyNews                           : 'input#keepSigned2',
  importantUpdates                      : 'input#keepSigned3' ,
  securityUpdates                       : 'input#keepSigned4',
  //user data
  userFullName                          : '.panel__header', // full name is concat two fields First name and Last name
  userDataIDS                           : '.text-list',
  //exeptions message
  exceptionMessage                      : 'span.field__message',
  //save info button 
  saveButton                            : '.button.btn.btn_lg.btn_blue.btn_width_xlg', // save info button
  saveButtonProgress                    : '.button.btn.btn_lg.btn_blue.btn_width_xlg.progress', // save info button in progress
  saveButtonSuccess                     : '.button.btn.btn_lg.btn_blue.btn_width_xlg.success', // save info button when success
  //buy browth plan -> go to plans
  buyGrowthPlanGreenBtn                 : 'button.btn.btn_green.trial-notice__btn'
}

export const plans = {
  //your website 
  youWebsiteDropList                    : '#website',
  youWebsiteDropListOption              : 'option',
  //plans radio
  planAnnually                          : '#annually', //  15 per/month
  planMonthly                           : '#monthly', //  10.5 per/month
  planBiannually                        : '#biannually', //  8.25 per/month
  //payment way 
  stripe                                : '#stripe',
  paypal                                : '#paypal',
  //promocode enter and get error message
  promocodeButton                       : 'button[title="Enter promo code"]',
  promocodeInput                        : 'input#promo' ,
  promocodeSubmit                       : 'button[title="Submit"]',
  promocodeSubmitError                  : '.footer-form__notice.error',
  //day price when choosed plan
  dayPrice                              : '.total-pay__price'
}

export const editorTopNav = {
  buyGrowthPlanTopLink                  : 'a[title="Buy a Growth Plan"]', //top panel if expired period
  viewPricingButton                     : 'button[title="View pricing"]', // if expired period
  buyGrowthPlanModalButton              : 'button[title="Buy a Growth Plan"]', //opened modal button
  readyToLanchSubmit                    : 'button[title="Ready to launch!"]', //opened modal button
  modeSelectors                         : '.item_348Ou' //not stable will be changed to data-test
}