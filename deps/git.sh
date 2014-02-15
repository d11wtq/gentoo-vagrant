git() {
  installed() {
    is_met() {
      which git 2>/dev/null
    }

    meet() {
      sudo emerge git
    }

    process
  }

  configured() {
    gitbin=`which git`

    is_met() {
      [[ `$gitbin config user.name` = "d11wtq" ]] &&
        [[ `$gitbin config user.email` = "chris@w3style.co.uk" ]]
    }

    meet() {
      $gitbin config --global user.name  d11wtq
      $gitbin config --global user.email chris@w3style.co.uk
    }

    process
  }

  requires installed
  requires configured
}