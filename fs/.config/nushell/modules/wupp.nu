export-env {
  $env.servers = ($env.servers | merge {
    wupp: {
      domain: wupp.dev,
      https: true,
      ssh: {
        user: server,
        port: 29945,
      }
    }
  })
}

export def ssh [] {
  qsh wupp
}

export def guia [] {
  xdg-open https://comicivans.github.io/server
}
