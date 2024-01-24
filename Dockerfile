FROM ruby:3.1.0

# ruby 镜像预设的这个环境变量干扰了后面的操作，将它重置为默认值
ENV BUNDLE_APP_CONFIG=.bundle

# apt 使用阿里云的源
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak && \
    echo "deb https://mirrors.aliyun.com/debian/ bullseye main non-free contrib" >/etc/apt/sources.list && \
    echo "deb-src https://mirrors.aliyun.com/debian/ bullseye main non-free contrib" >>/etc/apt/sources.list && \
    echo "deb https://mirrors.aliyun.com/debian-security/ bullseye-security main" >>/etc/apt/sources.list && \
    echo "deb-src https://mirrors.aliyun.com/debian-security/ bullseye-security main" >>/etc/apt/sources.list && \
    echo "deb https://mirrors.aliyun.com/debian/ bullseye-updates main non-free contrib" >>/etc/apt/sources.list && \
    echo "deb-src https://mirrors.aliyun.com/debian/ bullseye-updates main non-free contrib" >>/etc/apt/sources.list && \
    echo "deb https://mirrors.aliyun.com/debian/ bullseye-backports main non-free contrib" >>/etc/apt/sources.list && \
    echo "deb-src https://mirrors.aliyun.com/debian/ bullseye-backports main non-free contrib" >>/etc/apt/sources.list

# 如果需要安装其他依赖，修改这段内容
RUN apt-get update && apt-get install -y --no-install-recommends \
  postgresql-client

# 设置 gem 中国镜像，并安装 rails
RUN gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/ &&\
    bundle config mirror.https://rubygems.org https://gems.ruby-china.com &&\
    gem install rails -v 7.0.1

# 命令位置
WORKDIR /app

