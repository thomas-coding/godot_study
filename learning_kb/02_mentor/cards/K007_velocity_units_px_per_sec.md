# K007 - CharacterBody2D velocity units

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

Conclusion:
- `CharacterBody2D.velocity` 的单位是 px/s，常见错误是把期望速度再乘一次 `delta`，导致速度量纲错误。

Evidence:
- `godot/doc/classes/CharacterBody2D.xml` -> `velocity` 成员说明（明确提示不要把 `velocity` 设为 `desired_velocity * delta`）
- `godot/doc/classes/CharacterBody2D.xml` -> `move_and_slide` 描述（方法内部使用 physics delta）

Teaching Use:
- 用于快速排错“角色移动特别慢/跳跃异常”的新手高频问题。
