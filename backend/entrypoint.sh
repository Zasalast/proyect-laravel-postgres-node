#!/bin/bash
chmod +x backend/entrypoint.sh

# Esperar a que el contenedor de PostgreSQL esté listo
until nc -z -v -w30 postgres 5432; do
  echo "Esperando a que PostgreSQL esté disponible..."
  sleep 5
done

# Crear la base de datos de Laravel en PostgreSQL
php artisan migrate --seed

# Iniciar el servidor de Laravel
php artisan serve --host=0.0.0.0