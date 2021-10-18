# Deploy WebApp with Rsync docker action

This action publish your WebApp production folder to web server (or it may publish any folder of your project to any folder of your server) using rsync.

Rsync is very usefull application which can transfer huge data from one host to another. Rsync compress and split files and transfer only changed pices of files. So rsync transfer files very quicly.

To connect one host to another rsync can use SSH, so goal off this Action is creating connection using ssh keys and transfer files with rsync.

This document describe:

- input parameters of this Action
- how to create and store SSH key
- how to use this Action in your Action to pablish data to server

## Inputs

## `deployment_key`

**Required** This is rsa private key which will be used to connect by SSH.

## `server_folder`

**Required** This is server folder where files will be published.

## `server_name`

**Required** This server name or IP to connect to

## `server_user_name`

**Required** This servers user name who can connect by SSH

## `source_folder`

**Required** This your procect folder from with files will be copy

## Create SSH key

### 1. Create ssh key on your pc

```bash
ssh-keygen -t rsa
```

- on question 'Enter file in which to save the key' set '/home/YOUR_NAME/.ssh/id_rsa_deploy'
- on question 'nter passphrase (empty for no passphrase)' press enter
- on question 'Enter same passphrase again' press enter

### 2. Add created private key to your repository secrets with name 'DEPLOYMENT_KEY'

- `cat /home/YOUR_NAME/.ssh/id_rsa_deploy`
- copy private key text
- go to 'https://github.com/YOUR_NAME/YOUR_REPOSITORY_NAME/settings/secrets/actions' and add *New reopsitory Secret* with name 'DEPLOYMENT_KEY'

### 3. Add created public key to your deloy server

- print your public key:  
`cat /home/YOUR_NAME/.ssh/id_rsa_deploy.pub`
- copy your public key text
- login to your deploy host
- add your public key to '~/.ssh/authorized_keys':  
`vim ~/.ssh/authorized_keys`

## Secury other publish server parameters

To protect other publish server parameters add it to your repository secrets too. Go to 'https://github.com/YOUR_NAME/YOUR_REPOSITORY_NAME/settings/secrets/actions' and keys:

- `SERVER_FOLDER`: /var/www/your.server.com/www
- `SERVER_NAME`: your.server.com
- `SERVER_USER_NAME`: deloy_user

## Example usage

```yml
uses: kirill-scherba/publish-rsync@v1
with:
    deployment_key: ${{ secrets.DEPLOYMENT_KEY }}
    server_folder: ${{ secrets.SERVER_FOLDER }}
    server_name: ${{ secrets.SERVER_NAME }}
    server_user_name: ${{ secrets.SERVER_USER_NAME }}
    source_folder: './dist'
```

## License

[MIT](LICENSE)
