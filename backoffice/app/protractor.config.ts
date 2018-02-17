import { browser, Config } from 'protractor'

const ENV = process.env.NODE_ENV

const mochaOptsBasic = {
    timeout: 10000,
    fullTrace: true,
    reporter: 'spec'
}

const envgrep = process.env.ENV_GREP

if (envgrep) {
    mochaOptsBasic['grep'] = envgrep
}

const conf: Config = {
    baseUrl: 'https://backoffice.weblium.io',
    directConnect: true,
    capabilities: {
        browserName: 'chrome',
        chromeOptions: {
            args: ['--window-size=1500,1000']
        },
        shardTestFiles: false,
        maxInstances: 1
    },
    mochaOpts: mochaOptsBasic,
    specs: [
        './specs/**/*.spec.ts',
    ],
    framework: 'mocha',

    onPrepare() {
        browser.waitForAngularEnabled(false)
    },
    SELENIUM_PROMISE_MANAGER: false
}

exports.config = conf
