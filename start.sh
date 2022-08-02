#!/bin/bash
php artisan cache:clear
php artisan serve --host=0.0.0.0 --port=$PORT