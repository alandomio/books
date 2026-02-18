#!/bin/bash
# ralph-control.sh - Interaction Utility

COMMAND=$1

case $COMMAND in
  status)
    echo "📊 Project Status:"
    total=$(grep -c "\- \[" PLAN.md)
    done=$(grep -c "\- \[x\]" PLAN.md)
    echo "   Progress: $done / $total tasks"
    echo "   Last Activity:"
    tail -n 3 activity.md
    ;;
  
  reset)
    echo "WARNING: This will clear activity.md. Continue? (y/n)"
    read -r confirm
    if [ "$confirm" == "y" ]; then
        echo "# Ralph Activity Log" > activity.md
        echo "Cleared activity log."
    fi
    ;;
    
  validate)
    echo "Running Quality Gates..."
    # Replace with specific project commands
    if [ -f package.json ]; then npm test; fi
    if [ -f Cargo.toml ]; then cargo test; fi
    ;;
    
  *)
    echo "Usage: ./ralph-control.sh [status|reset|validate]"
    ;;
esac
