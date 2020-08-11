#!/bin/bash

apt-get install npm -y
npm install os -g
npm install http -g
npm install forever -g
npm install websocket -g
npm install child_process -g

forever start servidor.js
