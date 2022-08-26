# 引用 node 镜像
FROM node:6.10.3-slim 
# 安装 ngingx
RUN apt-get update \    && apt-get install -y nginx
# 创建 app 目录
WORKDIR /app
# 拷贝文件 到 app/
COPY . /app/
# 监听 80 端口
EXPOSE 80
# 编译构建 
RUN  npm install \
    && npm run build \
    && cp -r dist/* /var/www/html \
    && rm -rf /app
# 启动 nginx 
CMD ["nginx","-g","daemon off;"]