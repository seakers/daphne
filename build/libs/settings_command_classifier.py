# -*- coding: utf-8 -*-

import os

DATABASE = {
    'drivername': 'postgres',
    'host': os.environ['POSTGRES_HOST'],
    'port': os.environ['POSTGRES_PORT'],
    'username': os.environ['USER'],
    'password': os.environ['PASSWORD'],
    'database': 'daphne'
}
