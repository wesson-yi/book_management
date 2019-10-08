# 一个 <图书管理系统> 的 API
### 功能:
- 每个用户有一个初始账号并包含一定金额
- 用户可以向图书馆借书 (每次借还书完成后扣除一定费用)，当无余额时则无法借书
- 查询一个用户的账户和当前所借书详细情况，参数是用户
- 查询每本书当前剩余数量、借出总数、书于用户之间当前的租借情况

### 需要实现的 API 接口：
- 创建用户接口，请求的参数支持设置初始金额、返回用户 ID
- 创建一笔借书交易，参数是用户的 ID 和 书籍的 ID
- 创建一笔还书交易，参数是用户的 ID 和 书籍的 ID
- 查询一个用户的账户情况，参数是用户 ID，返回当前余额、借出书籍情况
- 查询某书籍的实际收入情况，参数是书籍的 ID 和 时间范围，返回此时间内该书籍所获取的交易金额

### 补充部分：
- 可以选择任意 Ruby 框架完成此 API
- 请提供 API 文档，让我们知道如何请求你的服务
- 在 README.md 中记录一下设计的思路
- 为节省时间，用户模块可以考虑使用成熟的 Gem 实现
- 如果时间允许，最好部署一个演示地址，能够直接调用
- 任何时候，用户的余额都一定是大于等于 0
- 关于书籍收入功能如果没有时间可以不做，优先借书还书功能

### 提交形式：
- 此测试完成之后，可以将代码 Push 到 GitHub 上，然后邮件告诉我们对应的Repo 地址和能够调用的 URL(如果有的话).

---

# 具体实现
注：**以上需求中，功能 4 与接口 5 之间存在细微出入，这里按照最大集实现**

***以下是展示的是设计思路，成型的 API 文档见，API.md***

### 1. API design
```
post /users
get  /users/:id

post /deals/borrow
post /deals/return

get /books/:id
get /books/:id/income
```

### 2. Model design

``` ruby
User <---- LibraryRecord ----> Book

User
name
age
gender
id_number
...
mobile
email
balance


Book
ISBN
name
author
description
available
load

LibraryRecord
status[借阅，续借、结束]
cost
deadline
finish_at
```
