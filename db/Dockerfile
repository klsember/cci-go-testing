FROM postgres:13.4 as builder

COPY ./migrations/ /docker-entrypoint-initdb.d

EXPOSE 5432