FROM oracleinanutshell/oracle-xe-11g
EXPOSE 1521
COPY src/main/resources/start_db.sql docker-entrypoint-initdb.d