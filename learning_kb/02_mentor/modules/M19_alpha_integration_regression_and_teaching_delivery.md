# M19 - Alpha integration regression and teaching delivery reliability

Status: Verified/Working
Version Scope: 4.6
Last Verified: 2026-06-24
Compatibility: unchanged

## Core Conclusion

- 小型 alpha 整合课不应继续无限加功能；应把已有系统串成一条可重复游玩的路线，并用固定回归清单压住回归风险。
- 关卡整合的核心边界是场景本地状态与跨场景状态：`reload_current_scene` 重建当前场景，适合重置事件、波次、Boss、奖励面板等 scene-local 状态；AutoLoad 状态不会自动重置。
- 切关链路要显式配置 `next_level_scene_path`，终关要明确为空或进入结算场景，避免误配 loopback。
- 第18课课堂暴露出教学交付问题：聊天代码块被复制到 Godot 时可能携带前导空格。后续教学必须把代码块独立成段、禁止演示函数误复制，并优先要求“替换整个函数/插入同级位置”的明确定位。

## Evidence

- Class docs:
  - `godot/doc/classes/SceneTree.xml`
    - `reload_current_scene`
    - `change_scene_to_file`
    - `scene_changed`
  - `godot/doc/classes/Node.xml`
    - scene tree lifecycle
    - `_ready`
    - groups
    - `queue_free`
  - `godot/doc/classes/PackedScene.xml`
    - `instantiate`
    - reusable scene files
  - `godot/doc/classes/Area2D.xml`
    - trigger regions and `body_entered`
  - `godot/doc/classes/Object.xml`
    - `has_signal`
    - `has_method`
- Project evidence:
  - `projects/first-game/scenes/event_trigger.gd`
  - `projects/first-game/scenes/event_trigger.tscn`
  - `projects/first-game/scenes/main.gd`
  - `projects/first-game/scenes/main.tscn`
  - `projects/first-game/scenes/hud.gd`
- Process evidence:
  - `learning_kb/01_learner/daily_reports/2026-06-24.md`
  - `learning_kb/00_plan/lesson_22_2h_runbook.md`
  - `learning_kb/03_sessions/session_protocol.md`

## Teaching Use

- Lesson22 课堂口径：
  1. 先固定 alpha 范围，不继续扩系统。
  2. 用一条玩家路线验证开始、收集、事件、波次/Boss、奖励、切关和重开。
  3. 问题按 P0/P1/P2 分类，只修阻塞路线的问题。
  4. 保留回归清单，后续每次大功能后重复执行。

- GDScript 代码交付口径：
  1. 代码块必须独立成段，不能嵌在列表缩进里。
  2. 不给会被误复制进项目的示例函数。
  3. 明确是“整段替换”还是“插入到某函数同级位置”。
  4. 用户已说明无需每次提醒手动修缩进；后续只保证交付格式干净。

## Fast Answer Snippet

- Alpha 课的目标不是“再加一个功能”，而是把已有功能变成可重复测试的一条路线：`start -> gameplay -> event -> combat -> reward -> transition/restart`。
- 如果一段教学代码粘贴后报顶级 `func` 缩进错误，优先判断为复制格式污染，不先怀疑 Godot 语法或业务逻辑。
