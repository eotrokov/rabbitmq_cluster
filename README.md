# RabbitMQ кластер c Docker-Compose

Создадим 3-х узловый кластер RabbitMQ с HAProxy, действующим в качестве балансировщика нагрузки.

Теперь запустите docker-compose file:

```sh
$ docker-compose up -d
```

Проверьте, работают ли контейнеры:

```sh
$ docker ps
```

Создайте кластер, выполнив:

```sh
$ docker exec -ti rabbitmq-node-2 bash -c "rabbitmqctl stop_app"
$ docker exec -ti rabbitmq-node-2 bash -c "rabbitmqctl join_cluster rabbit@rabbitmq-node-1"
$ docker exec -ti rabbitmq-node-2 bash -c "rabbitmqctl start_app"

$ docker exec -ti rabbitmq-node-3 bash -c "rabbitmqctl stop_app"
$ docker exec -ti rabbitmq-node-3 bash -c "rabbitmqctl join_cluster rabbit@rabbitmq-node-1"
$ docker exec -ti rabbitmq-node-3 bash -c "rabbitmqctl start_app"
```

Проверьте состояние кластера:

```sh
$ docker exec -ti rabbitmq-node-1 bash -c "rabbitmqctl cluster_status"
```

Доступ к статистическому отчету HAProxy по адресу `http://localhost:1936/haproxy?stats` с учетными данными `haproxy:haproxy`, и консоли RabbitMQ по адресу `http://localhost:15672/` с учетными данными `test:test`.
