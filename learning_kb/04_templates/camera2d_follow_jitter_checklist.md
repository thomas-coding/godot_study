# Camera2D Follow Jitter Checklist (Godot 4.6)

用途：出现“相机跟随抖动/拖尾不对/limit 卡顿”时，按顺序快速定位。

## 0) Baseline

- Camera2D 是当前相机（`enabled` + `make_current` 语义正确）。
- 玩家主位移逻辑所在回调已明确（physics 或 idle）。

## 1) Callback domain alignment

- 若玩家在 `_physics_process` 更新，Camera `process_callback` 优先设为 Physics。
- 若玩家在 `_process` 更新，Camera 可用 Idle。
- 先做回调域对齐，再调 smoothing。

## 2) Position diagnosis

- 不只看 `camera.global_position`。
- 同时检查：
  - `get_target_position()`（目标）
  - `get_screen_center_position()`（实际屏幕中心）

## 3) Smoothing diagnosis

- `position_smoothing_enabled` 开启时，先调 `position_smoothing_speed`。
- 参数变更后想立即观察结果：
  - `force_update_scroll()`
  - `reset_smoothing()`

## 4) Limits and drag

- 检查 `limit_enabled` / `limit_smoothed` 是否引入“到边缘拖拽感”。
- 检查 `drag_*_enabled` 与 `drag_*_margin` 是否导致“看起来慢半拍”。

## 5) Typical symptom mapping

- 症状：跟随时周期性抖动
  - 检查：玩家与相机更新域是否一致。
- 症状：参数改了画面不马上变化
  - 检查：是否调用 `force_update_scroll` / `reset_smoothing`。
- 症状：接近边界时拉扯
  - 检查：`limit_smoothed` 与 limit/drag 参数组合。

## Evidence anchors

- `godot/doc/classes/Camera2D.xml`
- `godot/scene/2d/camera_2d.cpp`
