# Docker镜像环境

| 应用程序 |     版本     |
| :------: |:----------:|
|   Java   |   8u361    |
|  Nginx   |   1.22.1   |
|  Redis   |   7.0.5    |
| ActiveMQ |   5.16.5   |
|  Kafka   | 2.13-3.3.1 |

docker自动安装：
```dockerfile
curl -sSL https://get.daocloud.io/docker | sh
```

docker启动
```dockerfile
sudo systemctl start docker
```

构建镜像：
```dockerfile
docker build -t [imageName]:latest .
```

运行镜像：[-p 指定需要暴露的端口]
```dockerfile
docker run -d -p 443:443 --name [imageName] [imageName]:latest
```

导出镜像：
```dockerfile
docker save -o [imageName].latest.alpha.tar [imageName]:latest
```

导入镜像：
```dockerfile
docker load < [imageName].latest.alpha.tar
```

前端访问：http://localhost:443