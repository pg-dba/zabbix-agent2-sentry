# zabbix-agent2-sentry

Не работает:
- мониторинг процессов Sentry, т.к. они в другом контейнере, а реализовано через zabbix proc.num ( https://www.zabbix.com/documentation/5.2/ru/manual/config/items/itemtypes/zabbix_agent )
- Сбор данных по events, хотя список dataItem events создаётся.
