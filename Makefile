up:
	docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	docker-compose -f ./srcs/docker-compose.yml down

clean: down
	docker system prune
	sudo rm -rf ~/data/database/* ~/data/webfiles/*

fclean: clean
	docker image prune -a
