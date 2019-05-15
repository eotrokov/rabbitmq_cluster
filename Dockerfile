FROM rabbitmq:3.7.8-management

RUN rabbitmq-plugins enable --offline rabbitmq_web_stomp
RUN rabbitmq-plugins enable --offline rabbitmq_event_exchange

EXPOSE 15674 25672 15674 5671 5672 4369 15671 15672
