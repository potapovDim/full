import { browser } from 'protractor';

import { flows } from './../app/flows';
import { Login } from './../app/models/login';
import { users } from './../app/users';

describe('test ', function () {
  before('open main page', async () => {
    await browser.get('/')
  })
  users.forEach(user => {
    user.flows.forEach(flow => {
      flows[flow](user)
    })
  })
})
