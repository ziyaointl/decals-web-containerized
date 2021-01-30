# decals-web-containerized

A repository for making decals-web containers.
Contains both the aws lite version and the NERSC spin version

## Usage
1. Install [docker](https://docs.docker.com/install/linux/docker-ce/debian/)
2. Clone this repo & init submodules
```bash
git clone --recurse-submodules https://github.com/ziyaointl/decals-web-containerized.git
```

### AWS (decals-web lite)
1. Copy the settings file you want to use. Example:
```bash
cd decals-web-containerized/decals-web-aws/decals-web/viewer
cp settings_pr_dev.py settings.py
```
2. Build & push container
```bash
cd decals-web-containerized/decals-web-aws
docker build -t <your tag> .
docker push <your tag>
```
3. Deploy on AWS Elasticbean Stalk / GKE / etc.

### Spin
1. Build & push container
```bash
cd decals-web-containerized/decals-web-spin/web
docker build -t <your tag one> .
cd ../app
docker build -t <your tag two> .
docker push <your tag one>
docker push <your tag two>
```
2. Update docker-compose.yml to point to the right tags. A current production copy of docker-compose.yml can be found in decals-web-spin/
3. Rancher upgrade
``` bash
rancher up --upgrade -d
```
4. If everything looks good, confirm upgrade
```bash
rancher up --upgrade --confirm-upgrade -d
```
