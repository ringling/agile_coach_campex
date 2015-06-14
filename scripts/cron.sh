#!/bin/bash
FILENAME=/root/db_backup/$(date +"%d%m%y_%H%M%S_agile_coach_campex_prod_db.bak")
docker exec -it postgresql sudo -u postgres pg_dump agile_coach_campex_prod > $FILENAME