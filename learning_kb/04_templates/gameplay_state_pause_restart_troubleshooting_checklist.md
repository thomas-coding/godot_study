# Gameplay State / Pause / Restart Troubleshooting Checklist (Godot 4.6)

用途：第4课最小状态流（start/play/pause/restart）实作时，按顺序排查“按键触发异常、暂停不生效、重开状态错乱”。

## 0) Baseline checks

- 引擎版本：确认为 `Godot 4.6 stable`。
- 场景入口：`project.godot` 的 `run/main_scene` 指向有效场景。
- 输入动作存在：`restart`、`pause_toggle`、`start_game`（或等价动作）已在 Input Map 配置。

## 1) Input route checks

- 热键处理建议放 `Main._unhandled_input`，避免和 UI 抢事件。
- 若多个节点都在处理同一热键，确认是否需要 `Viewport.set_input_as_handled()`。
- 若 UI 要拦截输入，确认是否使用了 `accept_event()` 并理解其影响范围。

## 2) Pause gate checks

- `get_tree().paused` 改变后，玩法节点应为 `PROCESS_MODE_PAUSABLE`。
- `Main` 若要在暂停时继续收热键，应设为 `PROCESS_MODE_ALWAYS`。
- 排查 `INHERIT` 链：子节点可能继承父节点 `ALWAYS` 导致“暂停不停止”。

## 3) Restart checks

- 推荐流程：`get_tree().paused = false` 后再 `reload_current_scene()`。
- 明确语义：重开会重建当前场景实例，但不会自动重置 autoload 单例状态。
- 重开后应验证：分数重置、收集物恢复、状态标签回到初始值。

## 4) Start gate checks

- 是否存在显式“未开始”状态（如 `is_game_started=false`）。
- 未开始状态下是否屏蔽玩法输入与计分更新。
- 开始后是否正确切换状态并隐藏启动提示。

## 5) Typical symptom mapping

- 症状：`P` 后显示 PAUSED，但玩家仍移动
  - 检查点：`Player.process_mode` 是否误继承 `ALWAYS`。
- 症状：按一次 `R` 执行两次重开
  - 检查点：是否有多个节点都在处理同一 `restart` 事件。
- 症状：重开后分数没有归零
  - 检查点：是否用了 autoload 保存分数但未在重开时清理。

## Evidence anchors

- `godot/doc/classes/Node.xml`
- `godot/doc/classes/SceneTree.xml`
- `godot/doc/classes/Viewport.xml`
- `godot/scene/main/node.cpp`
- `godot/scene/main/scene_tree.cpp`
- `godot/scene/main/viewport.cpp`
