# Tinypowers for OpenCode

Tinypowers is a streamlined fork of [Superpowers](https://github.com/obra/superpowers)
for [OpenCode.ai](https://opencode.ai). It retains seven core engineering
skills and omits the upstream bootstrap and other runtime skills.

## Installation

Add Tinypowers to the `plugin` array in your `opencode.json`:

```json
{
  "plugin": [
    "tinypowers@git+https://github.com/c-w-xiaohei/tinypowers.git"
  ]
}
```

Restart OpenCode, then ask: `List the Tinypowers skills`.

OpenCode discovers the retained skills through the plugin's `config` hook.

## Updating

Tinypowers is installed through a git-backed package spec. To pin a release:

```json
{
  "plugin": [
    "tinypowers@git+https://github.com/c-w-xiaohei/tinypowers.git#v6.1.1"
  ]
}
```

## Troubleshooting

- Check logs with `opencode run --print-logs "hello" 2>&1 | grep -i tinypowers`.
- Verify the plugin entry in `opencode.json`.
- Make sure you are running a recent version of OpenCode.

## Attribution

Tinypowers preserves the philosophy and retained skill content of obra's
Superpowers project. See the repository [LICENSE](../LICENSE) for the original
MIT license and copyright notice.

- Tinypowers: https://github.com/c-w-xiaohei/tinypowers
- OpenCode docs: https://opencode.ai/docs/
