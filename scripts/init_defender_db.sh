deployment=$1

if [[ "$deployment" == "" ]]; then
    echo "MISSING ARG! Usage: ./init_defender_db.sh <deployment>"
    exit 1
fi
ddosd.py --init-db -D -d $deployment -v
metrics.py -D -d $deployment --init -v
trigger_groups.py -D -d $deployment --update /home/support/pipedream/conffiles/default_triggers.json -v
