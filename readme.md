# Use separate staging/production AWS accounts for a Laravel Vapor project

These scripts allows you to use separate AWS account for your staging and production environments.

## How it works

1. Create two teams on Vapor (`App Production` and `App Staging`). Each team has their own AWS credentials.
2. Create a project inside `App production` (https://docs.vapor.build/1.0/projects/the-basics.html#creating-projects)
3. Rename `vapor.yml` to `vapor.production.yml`
4. Run `vapor team:switch`, switch to `App Staging` and create a new Vapor project
5. Rename `vapor.yml` to `vapor.staging.yml`
6. In Vapor `App Production` delete the staging environment, and in `App Staging` delete the production environment

Now you have two projects on Vapor in different teams connected to different AWS accounts. 

Copy `vapor.sh` and `deploy.sh` from this project and throw them in the root of your projects. 

## Interact with Vapor trough scripts

Change the .env file:

```
./vapor.sh staging env:pull staging
./vapor.sh staging env:push staging
```

Deploy:

```
./deploy.sh staging
```
