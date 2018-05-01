#! /bin/bash

mkdir ~/data
mkdir ~/data/db
sqlite3 -batch ~/data/db/citations.sqlite << EOF
CREATE TABLE points(id PRIMARY KEY AUTOINCREMENT, point STRING);
CREATE TABLE citation(pointId INTEGER, author INTEGER, title STRING, container INTEGER, contributors INTEGER PRIMARY KEY AUTOINCREMENT, version STRING, number STRING, publisher INTEGER, pubDate STRING, accessDate STRING, location STRING);
CREATE TABLE contributors(id0 INTEGER, id1 INTEGER);
CREATE TABLE container(id INTEGER PRIMARY KEY AUTOINCREMENT, name STRING);
REATE TABLE publisher( id INTEGER PRIMARY KEY AUTOINCREMENT, name STRING);
CREATE TABLE author(id INTEGER PRIMARY KEY AUTOINCREMENT, name STRING);
EOF
