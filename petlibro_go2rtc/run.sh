#!/bin/sh
set -e
OPT=/data/options.json
IP=$(jq -r '.camera_ip // ""' $OPT)
UID_=$(jq -r '.camera_uid // ""' $OPT)
Q=$(jq -r '.quality // "hd"' $OPT)
A=$(jq -r '.audio // false' $OPT)
if [ ${#UID_} -ne 20 ]; then echo "camera_uid must be the 20-character Petlibro camera ID"; exit 1; fi
SRC="petlibro://${IP}?uid=${UID_}&quality=${Q}&audio=${A}"
cat > /tmp/go2rtc.yaml <<YAML
streams:
  petlibro_feeder:
    - ${SRC}
api:
  listen: ":11984"
rtsp:
  listen: ":18554"
webrtc:
  listen: ":18555"
YAML
echo "Starting go2rtc for Petlibro camera ${IP:-<discovery>} (quality=${Q}, audio=${A})"
exec /usr/local/bin/go2rtc -config /tmp/go2rtc.yaml
