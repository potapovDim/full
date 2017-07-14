require('babel-core/register')

module.exports = {
  src_folders: ["./e2e/tests"],
  output_folder: "./e2e/reports",
  custom_commands_path: "./e2e/commands",
  custom_assertions_path: "",
  page_objects_path: "./e2e/pages",
  globals_path: "./e2e/globals.js",
  test_settings: {
    default: {
      skip_testcases_on_fail: false,
      launch_url: "",
      selenium_port: 4444,
      selenium_host: "127.0.0.1",
      silent: true,
      screenshots: {
        enabled: false,
        path: ""
      },
      desiredCapabilities: {
        browserName: "chrome",
        javascriptEnabled: true,
        acceptSslCerts: false
      }
    },
    phantom: {
      desiredCapabilities: {
        browserName: "phantomjs",
        javascriptEnabled: true,
        acceptSslCerts: true,
        "phantomjs.binary.path": "./node_modules/phantomjs/bin/phantomjs",
        "phantomjs.cli.args": [
          "--ignore-ssl-errors=true"
        ]
      }
    },
    safari: {
      desiredCapabilities: {
        browserName: "safari",
        version: "49"
      }
    },
    firefox: {
      desiredCapabilities: {
        browserName: "firefox",
        javascriptEnabled: true,
        acceptSslCerts: false
      }
    }
  }
}
