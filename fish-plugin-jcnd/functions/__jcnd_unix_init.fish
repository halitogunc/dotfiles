function __jcnd_unix_init
  switch (uname)
    case Linux
      __jcnd_linux_init
    case Darwin
      __jcnd_mac_init
    case FreeBSD NetBSD DragonFly
    case '*'
  end

  if not type -q subl
    if type -q subl3
      alias subl="subl3"
    end
  end
end
