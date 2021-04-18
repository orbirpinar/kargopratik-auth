local-up:
	docker-compose -f docker-compose-local.yml up -d
local-down:
	docker-compose -f docker-compose-local.yml down

prod-up:
	docker-compose up -d
prod-down:
	docker-compose down

db:
	docker exec -ti mysql bash

keycloak:
	docker exec -ti keycloak bash
