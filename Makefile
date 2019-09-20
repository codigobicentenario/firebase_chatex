bootstrap:
	docker-compose run --rm -T --no-deps firebase-chatex sh -c "mix deps.get && mix deps.compile"
	make ecto.setup

reset:
	docker-compose run --rm --no-deps firebase-chatex sh -c "rm -rf /app/src/deps/* /app/src/_build/dev/*"
	docker-compose stop
	docker-compose rm -f

start:
	docker-compose up -d firebase-chatex

restart:
	docker-compose restart firebase-chatex

restart.postgres:
	docker-compose restart postgres

stop:
	docker-compose stop firebase-chatex

stop.postgres:
	docker-compose stop postgres

logs:
	docker-compose logs -f firebase-chatex

logs.postgres:
	docker-compose logs -f postgres

shell:
	docker-compose run --rm firebase-chatex sh

shell.postgres:
	docker-compose run --rm postgres bash

shell.test:
	ENV=test docker-compose run --rm firebase-chatex sh

test:
	ENV=test docker-compose run --rm  firebase-chatex sh -c "mix test"

deps.update:
	docker-compose run --rm firebase-chatex sh -c "mix deps.clean --unused && mix deps.get && mix deps.compile"

ecto.setup:
	docker-compose run --rm firebase-chatex sh -c "mix ecto.setup"

ecto.reset:
	docker-compose run --rm firebase-chatex sh -c "mix ecto.reset"

ecto.migrate:
	docker-compose run --rm firebase-chatex sh -c "mix ecto.migrate"

ecto.gen.migration:
	docker-compose run --rm firebase-chatex sh -c "mix ecto.gen.migration ${file}"
