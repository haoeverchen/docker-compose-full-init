## Environment Setting
### Install nvm 
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
```
### Source your profile
```bash
source ~/.zshrc
```
### Install Node.js using nvm
```bash
nvm install v18.19.1
```
### Use the installed Node version
```bash
nvm use v18.19.1
```
### Set the default Node version
```bash
nvm alias default v18.19.1
```
### Install angular/cli
```bash
npm install -g @angular/cli@17.3
```


## Create a new project
```bash
ng new frontend --routing --style css
ng install
ng serve
```
### Fix permission
#### Clear npm Cache
```bash
sudo npm cache clean --force
```
#### Change the ownership of the npm directories to your user:
```bash
npm config set prefix '~/.npm-global'
export PATH=~/.npm-global/bin:$PATH
echo "export PATH=~/.npm-global/bin:$PATH" >> ~/.zshrc
```
```bash
sudo chown -R $(whoami):$(id -g) ~/.npm
```

### Dockerfile
```bash
docker build -f tools/docker/Dockerfile -t angular_dockerfile:1.0 .
```
```bash
docker run -p 4200:4200 angular_dockerfile:1.0
```