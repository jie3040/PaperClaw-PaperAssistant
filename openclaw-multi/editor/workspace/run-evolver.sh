#!/bin/bash
# Capability Evolver - Review Mode Runner
cd "$(dirname "$0")/skills/capability-evolver" || exit 1

echo "🧬 Running Capability Evolver in Review Mode..."
echo "   Agent: $(basename $(dirname $(dirname $(pwd))))"
echo "   Mode: Review (requires confirmation)"
echo ""

node index.js --review
