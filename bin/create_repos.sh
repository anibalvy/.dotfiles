install_k8s() {
  if [ -f /etc/apt/sources.list.d/kubernetes.list ]; then
    echo -e "k8s       ......... repo present"
  else
    echo -e "Installing repo for k8s apps like kubectl"
    curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.36/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
    sudo chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg # allow unprivileged APT programs to read this keyring
    # This overwrites any existing configuration in /etc/apt/sources.list.d/kubernetes.list
    echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.36/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
    sudo chmod 644 /etc/apt/sources.list.d/kubernetes.list # helps tools such as command-not-found to work correctly

  fi

}

install_kubecolor() {
  if [ -f /etc/apt/sources.list.d/kubecolor.sources ]; then
    echo -e "kubecolor ......... repo present"
  else
    echo -e "Installing repo for kubecolor"
    sudo apt update
    sudo apt install apt-transport-https wget --yes
    wget -O /tmp/kubecolor.deb https://kubecolor.github.io/packages/deb/pool/main/k/kubecolor/kubecolor_$(wget -q -O- https://kubecolor.github.io/packages/deb/version)_$(dpkg --print-architecture).deb
    sudo dpkg -i /tmp/kubecolor.deb
  fi
}
