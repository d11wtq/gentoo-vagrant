docker() {
  installed() {
    pkg_ver=0.8.1
    pkg_name=app-emulation/docker

    require kernel_config

    is_met() {
      which docker && `which docker` version | grep $pkg_ver
    }

    meet() {
      sudo emerge =$pkg_name-$pkg_ver --autounmask-write
      sudo etc-update --automode -5
      sudo emerge =$pkg_name-$pkg_ver
    }
  }

  rc() {
    is_met() {
      sudo rc-status default | grep docker
    }

    meet() {
      sudo rc-update add docker default
    }
  }

  groups() {
    is_met() {
      [[ `/bin/groups vagrant` =~ docker ]]
    }

    meet() {
      sudo usermod -aG docker vagrant
    }
  }

  require installed
  require rc
  require groups
}
