#!/bin/sh
cd /home/wolffram/nowcasting-data/
git pull
git add RSV_Infection/*
git add Seasonal_Influenza/*
git add Pneumococcal_Disease/*
git commit --allow-empty -m "update data"
git push