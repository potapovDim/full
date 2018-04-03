import { flows } from './../app/flows';
import { Login } from './../app/models/login';
import { users, baseUrl } from './../app/users';

import { client } from '../app/driver'

describe('test ', function() {

  before('open main page', async () => {
    await client.startDriver()
    await client.goTo(baseUrl)
    console.log(await client.getTitle())
    console.log(await client.getSize())
    console.log(await client.getUrl())
    console.log(await client.getBrowserTabs())
    console.log(await client.getCurrentBrowserTab())
  })

  after(async () => {
    await client.close()
    await client.stopDriver()
  })

  users.forEach(user => {
    user.flows.forEach(flow => {
      flows[flow](user)
    })
  })
})
