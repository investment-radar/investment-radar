# README

## 项目Vision

投资自身，投资股票，尽早实现财务自由，进而自由体验人生！

## 项目目标

1. 实现一个辅助进行股票投资的应用，通过收集和分析股票数据，持续优化选股，买入和卖出时机的自动化策略，来实现一个长期稳定的投资组合。
2. 在该项目中跟进和实践最新的跟Ruby和Rails相关的Web开发技术，不断提升开发经验和开发能力。

## 基本工具库和框架选择

* Ruby 2.4
* Rails 5.1 + Webpacker3.0
* Vue.js
* ES6 (not coffeescript)
* Bourbon
* Postgresql
* Puma
* Rspec, Capybara, FactoryBot, ffaker

## Gem的选择理念

尽可能使用Ruby和Rails已经提供的组件，不轻易引入非功能性的，辅助性的gem。
目标是保持项目的精简和灵活，随时可以进行新版本的升级。

比如：

* 直接使用`erb`，而不使用`slim`或者`haml`

* 直接使用`form_with`，而不再使用`simple_form`

## 功能性组件

* delayed_job
* font-awesome
* lograge

## 开发辅助gems

* rack-mini-profiler
* rubocop
* foreman
* reek
* pry, byebug
* better_errors

## 第三方服务

* mailgun - 邮件服务
* yahoo finance API

## 本地开发设置
1. 安装heroku-cli [Link](https://devcenter.heroku.com/articles/heroku-cli#macos)
2. 安装postgres.app
3. 安装yarn: `brew install yarn`
  * 如果本地没有node.js，需要安装，可以先安装nvm，然后再安装node
  * 运行：`yarn install`
4. 创建和设置数据库
  * `rails db:create db:migrate db:seed`
5. 启动web server和workers `heroku local`
	* 仅启动web server `heroku local web`
	* 仅启动worker `heroku local worker`
6. 或者安装`autoenv`,帮助自动加载.env中的环境变量,然后
  * 仅启动web server `rails s`
  * 仅启动worker `rake jobs:work`
7. 启动webpack dev server方便实时编译刷新浏览器
  * `./bin/webpack-dev-server`

## 测试说明

`bundle exec rspec`

## 代码质量

`rake rubycritic`

## 部署说明

部署到heroku
