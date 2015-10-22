#!/bin/sh

# move into greenscreen application directory
cd /srv/greenscreen

: ${COUCH_HOST:="http://couchdb"}
: ${COUCH_PORT:="5984"}
: ${COUCH_DB:="gscreen"}

cat > public/js/gscreen-config.js << EOF
angular.module("GScreen").constant('CONFIG',{
  chromecastApplicationId: '$CAST_APPID'
});
EOF

cat > config.json << EOF
{
  "couch": {
    "host": "$COUCH_HOST",
    "port": $COUCH_PORT,
    "db": "$COUCH_DB"
  },
  "server": {
    "port": 4994
  }
}
EOF

exec npm start
