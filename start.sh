#!/bin/bash
php artisan config:clear
php artisan route:clear
php artisan view:clear
php artisan cache:clear
php artisan optimize
php artisan serve --host=0.0.0.0 --port=$PORT