# README

**Guide d'installation du projet**

Si vous êtes sur linux : 
`sudo chown -R $USER:$USER .`

Build le projet:
`docker-compose build`

Up le projet :
`docker-compose up`

Créer la base de données :
`docker-compose run web rake db:create`

Stopper le projet :
`docker-compose down`
