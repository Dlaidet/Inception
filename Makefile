all: compose
	
compose:
	docker-compose -f ./srcs/docker-compose.yml up --build --detach

ps:
	docker-compose -f ./srcs/docker-compose.yml ps

stop:
	docker-compose -f ./srcs/docker-compose.yml down

prune: clean
	docker system prune -f
	sudo rm -rf /home/dlaidet/data/mariadb
	sudo rm -rf /home/dlaidet/data/wordpress
	mkdir /home/dlaidet/data/mariadb
	mkdir /home/dlaidet/data/wordpress

clean: stop
	docker rmi -f `docker images -qa`
	docker volume rm `docker volume ls -q`

re: clean compose

.PHONY: all clean compose ps stop prune re
