#!/bin/bash
php artisan session:table
php artisan cache:clear
php artisan migrate
php artisan serve --host=0.0.0.0 --port=$PORT