# Day 01 - 1h Runbook (from zero)

目标：在 1 小时内完成安装并跑通第一个可运行项目，形成“可继续”的起点。

## 今日唯一目标（英文）

`Today I will install Godot, create my first project, and run an empty scene.`

## 时间切片（60 分钟）

## 0-5 min: 启动检查

- 打开并快速浏览：
  - `learning_kb/00_plan/roadmap.md`
  - `learning_kb/01_learner/progress_log.md`
- 把上面的英文目标复制到你的当日日志。

## 5-20 min: 安装 Godot 4.x stable

- 入口：`https://godotengine.org/download/windows/`
- 先下载官方稳定版编辑器（Windows）。
- 安装完成后，确认能打开 Project Manager。

## 20-35 min: 新建项目并运行空场景

- 在 Project Manager 新建项目路径：`godot_study/projects/first_game`
- 创建一个 `Main` 场景并保存。
- 运行一次：
  - `F6` 运行当前场景，或
  - `F5` 设主场景后运行项目。
- 验收：能弹出游戏窗口且无红色报错。

## 35-48 min: 预创建输入映射（Input Map）

- 打开 `Project -> Project Settings -> Input Map`
- 创建动作：
  - `move_left`
  - `move_right`
  - `jump`
- 先绑定常用键即可（A/D/Space 或方向键组合）。

## 48-55 min: 官方文档快速对照（英文输入）

- 只读标题和关键段落（不深读）：
  - Nodes and Scenes:
    - https://docs.godotengine.org/en/stable/_sources/getting_started/step_by_step/nodes_and_scenes.rst.txt
  - Scripting languages:
    - https://docs.godotengine.org/en/stable/_sources/getting_started/step_by_step/scripting_languages.rst.txt

## 55-60 min: 收尾沉淀

- 写英文总结 3-5 行。
- 术语卡 1 条（例如 `main scene` 或 `Input Map`）。
- 在 `learning_kb/01_learner/progress_log.md` 追加今天的完成情况。

## 今日最小完成线

- Godot 已安装并可启动。
- `first_game` 项目可运行空场景。
- Input Map 三个动作已建立。

## 如果中途卡住（直接问 AI）

```text
我在 Godot 4 新手安装/创建项目阶段卡住了。请用英文回答，并附 Fixed Expressions & Terms (Glossary)。

Context:
- Step: 我卡在了预创建输入映射
- Error: 我已经创建好了，但是我不知道对不对
- What I tried:

Please provide:
1) Root cause
2) Minimal fix steps
3) Verify checklist
```
