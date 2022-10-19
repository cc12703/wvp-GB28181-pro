



cd ./web_src
npm --registry=https://registry.npm.taobao.org install
npm run build

cd ../
mvn clean package

docker build ./ --tag wvp-pro