FROM mysql:8.0

COPY scripts/ /docker-entrypoint-initdb.d/

EXPOSE 3306

ENV MYSQL_CHARSET=utf8mb4
ENV MYSQL_COLLATION=utf8mb4_unicode_ci
