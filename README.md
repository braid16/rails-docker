# 参照长乐未央文档修改

git clone 仓库

docker build -f Dockerfile -t rails7 .

docker compose run web bash 

app# bundle config set --local path vendor/bundle
app# bundle install
pp# rails importmap:install
app# rails turbo:install stimulus:install

app# bin/setup
app# exit

docker compose up -d

docker exec -it demo_web bash
app# rails s -b 0.0.0.0

docker exec -it demo_web bash
app# rails c


