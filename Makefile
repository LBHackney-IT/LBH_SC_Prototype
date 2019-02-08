.PHONY: docker-build
docker-build:
	docker-compose build

.PHONY: docker-down
docker-down:
	docker-compose down

.PHONY: bundle
bundle:
	docker-compose run --rm app bundle install

setup: docker-build

serve:
	rm tmp/pids/server.pid || echo ""
	docker-compose up

lint:
	docker-compose run --rm app rubocop

test:
	docker-compose run --rm app rspec

check: lint test
	echo 'Deployable!'

shell:
	docker-compose run --rm app /bin/bash

guard:
	docker-compose run --rm app guard

