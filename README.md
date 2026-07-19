# Tinypowers

Tinypowers is a streamlined fork of [Superpowers](https://github.com/obra/superpowers).
It keeps the core engineering disciplines while trimming the full methodology,
distribution, and repeated behavioral prompting.

Modern flagship models trained with stronger reinforcement learning need less
repetitive behavioral prompting than earlier or weaker models. Superpowers
offers a complete subagent development methodology, but its full distribution
and prompting are larger than needed for this use case. Tinypowers is the
compact edition and is intended to work best with flagship models.

Tinypowers is distributed as a portable skill library. Use the installation
method supported by your coding-agent harness, or add the repository's
`skills/` directory to its skill search path.

## Skills

- `subagent-driven-development`
- `test-driven-development`
- `systematic-debugging`
- `writing-plans`
- `requesting-code-review`
- `verification-before-completion`
- `dispatching-parallel-agents`

## Installation

Install or load this repository with your harness's native plugin or skill
mechanism:

`https://github.com/c-w-xiaohei/tinypowers`

### OpenCode

Add Tinypowers to the `plugin` array in your `opencode.json`:

```json
{
  "plugin": [
    "tinypowers@git+https://github.com/c-w-xiaohei/tinypowers.git"
  ]
}
```

Restart OpenCode after installation. OpenCode-specific details are available in
[`.opencode/INSTALL.md`](.opencode/INSTALL.md).

## Attribution

Tinypowers preserves the philosophy and retained skill content of obra's
Superpowers project. The original MIT license and copyright notice are kept in
[`LICENSE`](LICENSE); this repository is a fork with a narrower distribution.

Project: <https://github.com/c-w-xiaohei/tinypowers>
