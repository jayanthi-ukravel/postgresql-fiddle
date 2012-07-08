#!/bin/sh

psql -h 127.0.0.1 -l -A | grep "dbname"