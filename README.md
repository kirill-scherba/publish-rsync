# Hello world docker action

This action prints "Hello World" or "Hello" + the name of a person to greet to the log.

## Inputs

## `who-to-greet`

**Required** The name of the person to greet. Default `"World"`.

## Outputs

## `time`

The time we greeted you.

## Create SSH key

### 1. Create ssh key on your pc

    ssh-keygen -t rsa

- on question 'Enter file in which to save the key' set '/home/YOUR_NAME/.ssh/id_rsa_deploy'
- on question 'nter passphrase (empty for no passphrase)' press enter
- on question 'Enter same passphrase again' press enter

### 2. Add created private key to your repository secrets with name 'DEPLOYMENT_KEY'

- cut '/home/YOUR_NAME/.ssh/id_rsa_deploy'
- copy private key text
- go to 'https://github.com/YOUR_NAME/YOUR_REPOSITORY_NAME/settings/secrets/actions' and add *New reopsitory Secret* with name 'DEPLOYMENT_KEY'

### 3. Add created public key to your deloy server

Bla-Bla-Bla ...

## Example usage

    uses: kirill-scherba/publish-rsync@v1
    with:
      deployment_key: ${{ secrets.DEPLOYMENT_KEY }}
