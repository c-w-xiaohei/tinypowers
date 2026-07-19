#!/usr/bin/env bash
# Test: Plugin Loading
# Verifies that the Tinypowers plugin loads correctly in OpenCode
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "=== Test: Plugin Loading ==="

# Source setup to create isolated environment
source "$SCRIPT_DIR/setup.sh"

# Trap to cleanup on exit
trap cleanup_test_env EXIT

plugin_link="$OPENCODE_CONFIG_DIR/plugins/tinypowers.js"

# Test 1: Verify plugin file exists and is registered
echo "Test 1: Checking plugin registration..."
if [ -L "$plugin_link" ]; then
    echo "  [PASS] Plugin symlink exists"
else
    echo "  [FAIL] Plugin symlink not found at $plugin_link"
    exit 1
fi

# Verify symlink target exists
if [ -f "$(readlink -f "$plugin_link")" ]; then
    echo "  [PASS] Plugin symlink target exists"
else
    echo "  [FAIL] Plugin symlink target does not exist"
    exit 1
fi

# Test 2: Verify skills directory is populated
echo "Test 2: Checking skills directory..."
actual_skills=$(for skill_dir in "$TINYPOWERS_SKILLS_DIR"/*/; do basename "$skill_dir"; done | sort)
expected_skills=$(printf '%s\n' \
    dispatching-parallel-agents \
    requesting-code-review \
    subagent-driven-development \
    systematic-debugging \
    test-driven-development \
    verification-before-completion \
    writing-plans)
if [ "$actual_skills" = "$expected_skills" ]; then
    echo "  [PASS] Found the exact Tinypowers skill set"
else
    echo "  [FAIL] Unexpected skill set in $TINYPOWERS_SKILLS_DIR"
    printf 'Expected:\n%s\nActual:\n%s\n' "$expected_skills" "$actual_skills"
    exit 1
fi

# Test 3: Verify plugin JavaScript syntax (basic check)
echo "Test 3: Checking plugin JavaScript syntax..."
if node --check "$TINYPOWERS_PLUGIN_FILE" 2>/dev/null; then
    echo "  [PASS] Plugin JavaScript syntax is valid"
else
    echo "  [FAIL] Plugin has JavaScript syntax errors"
    exit 1
fi

# Test 4: Verify plugin does not reference a hardcoded skills path
echo "Test 4: Checking plugin does not advertise a wrong skills path..."
if grep -q 'configDir}/skills/' "$TINYPOWERS_PLUGIN_FILE"; then
    echo "  [FAIL] Plugin references a hardcoded configDir skills path"
    exit 1
else
    echo "  [PASS] Plugin does not advertise a misleading skills path"
fi

# Test 5: Verify personal test skill was created
echo "Test 5: Checking test fixtures..."
if [ -f "$OPENCODE_CONFIG_DIR/skills/personal-test/SKILL.md" ]; then
    echo "  [PASS] Personal test skill fixture created"
else
    echo "  [FAIL] Personal test skill fixture not found"
    exit 1
fi

echo ""
echo "=== All plugin loading tests passed ==="
