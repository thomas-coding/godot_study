# M07 - Resource Loading and Scene Instancing

Status: Verified
Version Scope: 4.6
Last Verified: 2026-02-07
Compatibility: unchanged

## Core Conclusion

- `ResourceLoader.load()` 默认带缓存复用语义，重复加载同一路径通常会复用缓存资源。
- 对大资源或切场景预热，优先用 `load_threaded_request` + `load_threaded_get_status` 轮询，避免主线程长阻塞。
- 场景实例化链路是 `PackedScene.can_instantiate()` -> `PackedScene.instantiate()`；实例化会在根节点触发 `NOTIFICATION_SCENE_INSTANTIATED`。

## Evidence

- Class docs: `godot/doc/classes/ResourceLoader.xml`
  - `load`（缓存语义与 `cache_mode`）
  - `has_cached`
  - `load_threaded_request` / `load_threaded_get_status` / `load_threaded_get`
  - `CACHE_MODE_*` 常量
- Class docs: `godot/doc/classes/PackedScene.xml`
  - `can_instantiate`, `instantiate`, `pack`
- Source: `godot/core/io/resource_loader.cpp`
  - `ResourceLoader::load`
  - `ResourceLoader::_load_start`（`CACHE_MODE_REUSE` 分支读取 `ResourceCache`）
  - `ResourceLoader::load_threaded_get_status`
- Source: `godot/scene/resources/packed_scene.cpp`
  - `PackedScene::can_instantiate`
  - `PackedScene::instantiate`
  - `Node::NOTIFICATION_SCENE_INSTANTIATED` 触发点

## Teaching Use

- 教学默认策略：
  1. 小项目先 `preload` / `load`（简单）
  2. 大资源与切换过场再上 threaded loading
  3. 生成实体时明确“复用缓存资源 vs 新实例化节点”的边界

## Fast Answer Snippet

- `load_threaded_get()` 在资源未完成时会阻塞调用线程；先看 `load_threaded_get_status()` 再取结果。
