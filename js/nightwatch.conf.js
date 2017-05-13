//require('babel-core/register');

module.exports = {
  src_folders: ["./tests"],
  output_folder: "./tests_output",
  custom_commands_path: "./commands",
  custom_assertions_path: "",
  page_objects_path: "./pages",
  globals_path: "globals.js",
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
        acceptSslCerts: true
      }
    }
  }
}
