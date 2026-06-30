# M22 - Learning-first local Godot curriculum

Status: Working
Version Scope: 4.6
Last Verified: 2026-06-30
Compatibility: unchanged

## Core Conclusion

- When the goal is learning Godot rather than shipping this specific game, lessons after the first vertical slice should be organized by capability coverage.
- Content additions are useful only when they teach a transferable Godot skill:
  1. complex gameplay object organization.
  2. input and UI propagation boundaries.
  3. Control-based UI/menu state flow.
  4. Resource/data boundaries.
  5. debugging, stability, and local export validation.
- The current local learning route should treat Lesson25-Lesson36 as required capability coverage and Lesson37-Lesson42 as electives.

## Evidence

- Project planning:
  - `learning_kb/00_plan/local_godot_learning_curriculum_after_lesson24.md`
  - `learning_kb/00_plan/lesson_queue.md`
  - `learning_kb/00_plan/roadmap.md`
- Godot anchors:
  - `godot/doc/classes/Node.xml`
  - `godot/doc/classes/InputMap.xml`
  - `godot/doc/classes/Viewport.xml`
  - `godot/doc/classes/Control.xml`
  - `godot/doc/classes/SceneTree.xml`
  - `godot/doc/classes/Resource.xml`

## Teaching Use

- Use this module when preparing Lesson25+.
- Default answer if asked “why are we still adding game features?”:
  - The feature is only a carrier. The lesson objective is the transferable Godot capability behind it.
- Default answer if asked “can we skip Steam?”:
  - Yes. Keep local export validation, but remove Steamworks/store/release-management topics from the required path.

## Lesson Mapping

- Lesson25: Boss as complex gameplay object.
- Lesson26: input interaction boundaries.
- Lesson27: UI/menu state flow.
- Lesson28: Animation/Tween/Timer feedback.
- Lesson29: audio system basics.
- Lesson30: Resource/data-driven depth.
- Lesson31: scene organization and reuse.
- Lesson32: save/settings completeness.
- Lesson33: debugging workflow.
- Lesson34: performance and stability.
- Lesson35: local export/package validation.
- Lesson36: project closure and reusable learning summary.
