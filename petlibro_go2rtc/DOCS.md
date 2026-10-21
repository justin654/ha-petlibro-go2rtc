# Petlibro Camera (go2rtc)

Runs tannerln7's go2rtc build with the clean-room `petlibro://` LAN transport. Nothing is installed on the feeder; the Petlibro app keeps working.

## Options
- **camera_ip**: feeder IP (reserve it in your router). Leave empty to use LAN discovery.
- **camera_uid**: 20-character camera ID (`cameraId` from the Petlibro cloud device list).
- **quality**: `hd` (1080p) or `sd`.
- **audio**: include AAC audio.

## Ports (host network)
- RTSP: `rtsp://<HA_IP>:18554/petlibro_feeder`
- go2rtc web UI/API: `http://<HA_IP>:11984`

Non-default ports avoid clashing with Home Assistant's built-in go2rtc and Frigate.

Add to HA with the Generic Camera integration (stream source `rtsp://127.0.0.1:18554/petlibro_feeder`) or in Frigate.
