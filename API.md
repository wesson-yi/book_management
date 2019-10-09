# Model design

``` ruby
User <---- LibraryRecord ----> Book
```

| User      | LibraryRecord            | Book        |
| --------- | ------------------------ | ----------- |
| name      | status[借阅，续借、结束] | ISBN        |
| age       | cost                     | title       |
| gender    | deadline                 | author      |
| ID_number | finish_at                | description |
| mobile    |                          | available   |
| email     |                          | borrowed    |
| balance   |                          |             |
| admin     |                          |             |


# API design

```
post /users
get  /users/:id

post /deals/borrow
post /deals/return

get /books/:id
get /books/:id/income
```

## 客户端错误
```ruby
# 一般有以下几种情况：
# Http status code 400, 401, 403, 404, 422 格式都是：
{ error_code: 10001, message: 'error message' }
```

## Auth Token
Token 需要通过 http header 的 `X-AUTH-TOKEN` 发送。

## 创建用户
POST /users
``` ruby
user: {
  name: 'username',
  age: 26,
  gender: 'male',
  ID_number: '411684199211103432',
  mobile: '15136167907',
  email: 'wesson.yi@gmail.com',
  balance: 1_000,
  password: '0000'
}
```
< 201
```ruby
{
    id: 3
}
```


## 查看用户
GET /users/:id
< 200

```ruby
{
  id: 1,
  name: 'username',
  gender: 'male',
  balance: 500,
  borrow_books: [
    {
      ISBN: '978-3-16-148410-0',
      name: '飘'
    }
  ]
}
```

## 借书
POST /deals/borrow
```ruby
{
  user_id: 1,
  book_id: 1
}
```
< 201

## 还书
POST /deals/return
```ruby
{
  user_id: 1,
  book_id: 1
}
```
< 201

## 查看某书
GET /books/:id
< 200
```ruby
{
  id: 1,
  ISBN: '978-3-16-148410-0',
  title: '飘',
  author: '玛格丽特',
  description: '美国南北战争前夕',
  available: 50,
  borrowed: 40,
  libray_record: [
    {
      username: 'username',
      status: '续借',
      created_at: 'datetime'
    }
  ]
}
```
## 查看某书收益
GET /books/:id/income
```json
{
  start_time: '2018-01-25T00:00:00+08:00',
  end_time: '2025-01-25T00:00:00+08:00'
}
```
< 200
```ruby
{
  income: 20
}
```