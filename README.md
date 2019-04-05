# README

## 项目 Vision

投资自身，投资股票，尽早实现财务自由，进而自由体验人生！

## 项目目标

1. 实现一个辅助进行股票投资交易的应用，通过收集和分析股票交易数据，持续优化选股，买入和卖出时机的自动化策略，来实现一个长期稳定的股票资金管理系统。
2. 在该项目中跟进和实践最新的 Ruby on Rails 和相关的 Web 前端开发技术，不断提升开发经验和开发能力。
3. 实践 Component-Based Rails Applications 的架构理念

## 基本工具库和框架选择

- Ruby 2.5
- Rails 5.2 + Webpacker4.0
- React.js
- ES6 (not coffeescript)
- Materialize CSS
- Postgresql
- Puma
- Rspec, Capybara, FactoryBot, ffaker

## Gem 的选择理念

尽可能使用 Ruby 和 Rails 已经提供的组件，不轻易引入非功能性的，辅助性的 gem。
目标是保持项目的精简和灵活，随时可以进行新版本的升级。

比如：

- 直接使用`erb`，而不使用`slim`或者`haml`
- 直接使用`form_with`，而不再使用`simple_form`

## 功能性组件

- delayed_job
- font-awesome
- lograge

## 开发辅助 gems

- rack-mini-profiler
- rubocop
- foreman
- reek
- pry, byebug
- better_errors

## 第三方服务

- SendGrid - 邮件服务
- IEX cloud - 股票数据 API

## 本地开发设置

1. 安装 heroku-cli [Link](https://devcenter.heroku.com/articles/heroku-cli#macos)
2. 安装 postgres.app
3. 安装 yarn: `brew install yarn`

- 如果本地没有 node.js，需要安装，可以先安装 nvm，然后再安装 node
- 运行：`yarn install`

4. 创建和设置数据库

- `rails db:create db:migrate db:seed`

5. 启动 web server 和 workers `heroku local`

- 仅启动 web server `heroku local web`
- 仅启动 worker `heroku local worker`

6. 或者安装`autoenv`,帮助自动加载.env 中的环境变量,然后

- 仅启动 web server `rails s`
- 仅启动 worker `rake jobs:work`

7. 启动 webpack dev server 方便实时编译刷新浏览器

- `./bin/webpack-dev-server`

## 测试说明

安装 chrome-headless: `brew install chromedriver`
运行测试：
`bundle exec rspec`

## 代码质量

### 运行 rubocop 和 reek 代码检查

`rake quality`

### rubycritic report

`rake rubycritic`

## CI 以及部署说明

- 每次代码提交到 master branch 都会触发 Pipelines 运行测试
- 部署到 heroku
