# K036 - Viewport runtime AA and pixel-snap controls

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Conclusion:
- `Viewport` 的 MSAA、屏幕空间 AA、TAA、debanding、2D 像素对齐都可运行时切换，并由 `RenderingServer.viewport_set_*` 落地。

Evidence:
- `godot/doc/classes/Viewport.xml` -> `msaa_2d`, `msaa_3d`, `screen_space_aa`, `use_taa`, `use_debanding`, `snap_2d_*`
- `godot/scene/main/viewport.cpp` -> `Viewport::set_msaa_2d` 等 setter 调用 RS
- `godot/servers/rendering/rendering_server.h` -> `viewport_set_*` 接口定义

Teaching Use:
- 用于实现“画质/清晰度/平滑度”运行时选项，并解释性能与观感 trade-off。
