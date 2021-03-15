pushd .
cd /tmp
sudo apt install make -y
if [ -x "$(which az)" ]; then
  echo "az is already installed!"
else
  curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
fi

if [ -x "$(which istioctl)" ]; then
  echo "istioctl is already installed!"
else
  curl -sL https://istio.io/downloadIstioctl | sh -
  echo "PATH=\$PATH:\$HOME/.istioctl/bin" | tee -a $HOME/.bashrc
fi

if [ -x "$(which kubectl)" ]; then
  echo "kubectl is already installed!"
else
  curl -LO https://dl.k8s.io/release/v1.19.7/bin/linux/amd64/kubectl
  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
fi
popd
