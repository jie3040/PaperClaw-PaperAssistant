#!/usr/bin/env python3
"""
Quick health check for all 8 AI agents in the paper-writing pipeline.
"""
import json
import urllib.request
import urllib.error
from datetime import datetime

AGENTS = [
    {"name": "Leader (Alex)", "port": "main", "url": "http://127.0.0.1:18800/hooks/agent"},
    {"name": "Surveyor", "port": 18810, "url": "http://127.0.0.1:18810/hooks/agent"},
    {"name": "Ideator", "port": 18820, "url": "http://127.0.0.1:18820/hooks/agent"},
    {"name": "Architect", "port": 18830, "url": "http://127.0.0.1:18830/hooks/agent"},
    {"name": "Writer", "port": 18840, "url": "http://127.0.0.1:18840/hooks/agent"},
    {"name": "Reviewer", "port": 18850, "url": "http://127.0.0.1:18850/hooks/agent"},
    {"name": "Artist", "port": 18860, "url": "http://127.0.0.1:18860/hooks/agent"},
    {"name": "Editor", "port": 18870, "url": "http://127.0.0.1:18870/hooks/agent"},
]

def check_agent(agent):
    """Check if an agent is responsive."""
    try:
        req = urllib.request.Request(agent["url"], method='GET')
        with urllib.request.urlopen(req, timeout=2) as response:
            return {
                "name": agent["name"],
                "port": agent["port"],
                "status": "healthy" if response.status in [200, 405] else "degraded",
                "code": response.status
            }
    except urllib.error.URLError as e:
        if hasattr(e, 'reason'):
            return {
                "name": agent["name"],
                "port": agent["port"],
                "status": "down",
                "error": "connection_refused"
            }
        elif hasattr(e, 'code'):
            return {
                "name": agent["name"],
                "port": agent["port"],
                "status": "degraded",
                "code": e.code
            }
    except Exception as e:
        return {
            "name": agent["name"],
            "port": agent["port"],
            "status": "error",
            "error": str(e)
        }

def main():
    results = []
    for agent in AGENTS:
        results.append(check_agent(agent))
    
    output = {
        "timestamp": datetime.now().isoformat(),
        "agents": results,
        "summary": {
            "total": len(results),
            "healthy": sum(1 for r in results if r["status"] == "healthy"),
            "down": sum(1 for r in results if r["status"] == "down"),
            "degraded": sum(1 for r in results if r["status"] in ["degraded", "timeout", "error"])
        }
    }
    
    print(json.dumps(output, indent=2))

if __name__ == "__main__":
    main()
