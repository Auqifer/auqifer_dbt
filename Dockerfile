# Используем официальный Python-образ
FROM python:3.10-slim-buster

# Устанавливаем рабочую директорию
WORKDIR /usr/src/app

# Устанавливаем зависимости pip
RUN pip install --upgrade pip
RUN pip install dbt-bigquery==1.8.2

# Копируем ваш dbt-проект внутрь контейнера
COPY . .

# Устанавливаем зависимости dbt
RUN dbt deps

# Команда для запуска по умолчанию
CMD ["dbt", "run"]