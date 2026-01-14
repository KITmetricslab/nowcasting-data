#!/bin/sh
cd /home/stat-health/nowcasting-data/
git pull --no-rebase
git add covid19/*
git add RSV_Infection/*
git add Seasonal_Influenza/*
git add Pneumococcal_Disease/*
git add Noroviral_Gastroenteritis/*
git add Rotavirus_Gastroenteritis/*
git add Listeriosis/*
git add Salmonellosis/*
git add Campylobacteriosis/*
git add Meningococcal_Disease/*
git add Lyme_Disease/*
# git add Tick-borne_encephalitis/*
git add Legionnaires_Disease/*
git commit --allow-empty -m "update data"
git push