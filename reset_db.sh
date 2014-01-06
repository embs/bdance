#!/bin/bash
rake db:drop:all db:create db:migrate db:test:prepare