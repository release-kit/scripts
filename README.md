# Release Kit Scripts

Useful scripts

## Ubuntu 18

### Setup Github Actions Self-Hosted Runner Tools

Run as `root`:

```sh
source <(wget -qO- https://raw.githubusercontent.com/release-kit/scripts/main/ubuntu-18/github-actions-runner-tools.sh)
```

## Environment variables

### Load envs from file

> **Note**  
> This scripts requires writing local file  
> Otherwise, it will be executed in a subshell, causing no envs to be written

```sh
wget -qO ./temp https://raw.githubusercontent.com/release-kit/scripts/main/envs/load.sh
source ./temp
rm ./temp
```

Parameters (use `export PARAM="value"`):

- `ENV` - `production` / `development` / `test`  
  Will also use `.env.$ENV` and `.env.$ENV.local` files

- `ENV_DIR` - directory where .env files are located  
  (`.` is the default value)
