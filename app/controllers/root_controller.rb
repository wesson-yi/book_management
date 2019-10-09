class RootController < ActionController::API
  def index
    render json: {
      title: '图书管理系统 API',
      version: 'v1.0-preview',
      doc: 'https://documenter.getpostman.com/view/2853886/SVtTyoJa'
    }
  end

  def routing_error
    render json: {
      code: 'route_not_found',
      message: '访问的接口路径不存在'
    }, status: :not_found
  end
end
