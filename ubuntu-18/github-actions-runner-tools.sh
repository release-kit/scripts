############
## Shared ##
############

apt-get update
apt-get install ca-certificates curl gnupg lsb-release

############
## Docker ##
############

mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update
apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
chmod 666 /var/run/docker.sock

####################
## Node.js + Yarn ##
####################

curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
apt-get install -y nodejs
apt-get install -y build-essential
yes | npm i -g yarn

############
## Runner ##
############

echo "export RUNNER_ALLOW_RUNASROOT=\"1\"" >> ~/.bashrc
export RUNNER_ALLOW_RUNASROOT="1"

mkdir actions-runner && cd actions-runner
curl -o actions-runner-linux-x64-2.294.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.294.0/actions-runner-linux-x64-2.294.0.tar.gz
tar xzf ./actions-runner-linux-x64-2.294.0.tar.gz

./config.sh

# run as service
./svc.sh install
./svc.sh start