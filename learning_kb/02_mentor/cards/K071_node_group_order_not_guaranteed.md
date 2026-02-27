# K071 - Node group order is not guaranteed

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-27
Compatibility: unchanged

Conclusion:
- `Node.add_to_group()` 的文档明确说明组内顺序不保证（为性能考虑），不要把组顺序当成稳定逻辑依赖。

Evidence:
- `godot/doc/classes/Node.xml` -> `add_to_group` note

Teaching Use:
- 用于解释“同一组节点遍历顺序偶发变化”与“波次处理不要依赖组顺序”的课堂问题。
