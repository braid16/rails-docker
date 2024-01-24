# 参照长乐未央文档修改

git clone https://github.com/braid16/rails-docker.git

`docker build -f Dockerfile -t rails7 .`

`docker compose run web bash` 


```shell
cd demo
app# bundle config set --local path vendor/bundle
app# bundle install
app# rails importmap:install
app# rails turbo:install stimulus:install
app# bin/setup
app# exit


`docker compose up -d`

`docker exec -it demo_web bash`

`app# rails s -b 0.0.0.0`

`docker exec -it demo_web bash`



