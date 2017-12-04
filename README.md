# fn-utils
Utilities for the fn project

```bash
# starts all services
./scripts/start.sh
# stops all services
./scripts/stop.sh
# update all docker images
./scripts/pull.sh

# exports bash functions for interacting with Flow Server
source ./scripts/flow.sh

flow_create
flow_add_delay

flow_get 3a00624c-5e8e-42c1-a4b5-ba593896251f
flow_await 3a00624c-5e8e-42c1-a4b5-ba593896251f 0
