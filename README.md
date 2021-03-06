# HoldMyDog

## Instructions
### How to start the project with Docker
```bash
docker-compose build
docker-compose run console bundle exec rails db:create
docker-compose run console bundle exec rails db:migrate
docker-compose up
```

### How to run the app in background
```bash
docker-compose up -d
```

### How to attach to the container
#### 1. Check docker containers up
```bash
docker ps
```
#### 2. You will see something like this
```bash
CONTAINER ID   IMAGE                  COMMAND                  CREATED         STATUS                   PORTS                                       NAMES
e8d217b80c7d   hold-my-dog:0.0.1      "/bin/bash"              7 minutes ago   Up 7 minutes                                                         holdmydog_console_1
d427f4396a99   hold-my-dog:0.0.1      "bundle exec rails s…"   18 hours ago    Up 6 seconds             0.0.0.0:3000->3000/tcp, :::3000->3000/tcp   holdmydog_rails_1
0628cf9f6a3e   postgres:13.3-alpine   "docker-entrypoint.s…"   19 hours ago    Up 7 minutes (healthy)   0.0.0.0:5432->5432/tcp, :::5432->5432/tcp   holdmydog_postgres_1
7b3afc27efbb   redis:6.2.5-alpine     "docker-entrypoint.s…"   19 hours ago    Up 7 minutes (healthy)   0.0.0.0:6379->6379/tcp, :::6379->6379/tcp   holdmydog_redis_1
```
#### 3. Copy ID of needed container and run
```bash
docker attach d427f4396a99
```
> From this moment you will see logs from container


### How to run the test suite
```bash
docker-compose run console bundle exec rspec
```

### How to run rubocop
```bash
docker-compose run console bundle exec rubocop
```

### How to open console in Docker
```bash
docker-compose exec console bash
```

### How to open rails console in Docker
```bash
docker-compose exec console bundle exec rails c
```

## Conventions & Rules
### Development process
1. Assign a ticket in Trello to yourself
2. Move ticket to In Progress
3. Pull latest master branch
4. Create a new branch from master for the ticket
5. Do some magic ;)
6. Push your magic to GitLab
7. Open MR to master branch
8. Ensure that CI builds is green
9. Assign a reviewer to MR
10. Move ticket in Trello to On Review
11. Add your reviewer to ticket in Trello
12. Wait a little for reviewer do his magic too!
13. Get a review comments
14. Fix implementation and ensure all comments were handled
15. Ask a reviewer for the second review
16. Get an approval and merged MR
17. Your tiket is done.


### CI/CD
Our CI/CD is configured to run liner (rubocop) first and then specs in parallel splitted by type.

### Merge rules
Required steps:
1. Merge request opened
2. Link to MR pasted into Trello card as a comment and reviewer is mentioned
3. Reviewer assigned to MR in GitLab
4. CI Pipelines is green

### Branch naming convention
1. Use prefix for branch name based on type of ticket: bug/feature/hotfix
2. Use uniq short but descriptive name for branch:
	- `bug/sign-up-404`
	- `hotfix/protect-login-from-invalid-users`
	- `feature/sign-in-page`


## Dependencies
| Package    | Version |
|------------|---------|
| Ruby       | 3.0.2   |
| Yarn       | 1.22.10 |
| Node.js    | 14.17.4 |
| PostgreSQL | 13.3    |
| Redis      | 6.2.5   |
| Docker     | 20.10.7 |