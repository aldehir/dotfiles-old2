windows_virtualbox="/mnt/c/Program Files/Oracle/VirtualBox"

if [[ -e /opt/vagrant ]]; then
  if [[ -n "${WSLENV+x}" ]]; then
    export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
    [[ -e "$windows_virtualbox" ]] && export PATH="$windows_virtualbox:$PATH"
  fi

  export PATH="/opt/vagrant/bin:$PATH"
fi
