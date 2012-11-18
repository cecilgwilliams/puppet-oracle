class oracle::users {
	group { ["$oracle::group", "dba", "oper"]:
	  ensure => "present",
	}


	user { "$oracle::user":
	  ensure => "present",
	  gid => "$oracle::group",
	  groups => ["dba", "oper"],
	  managehome => true,
	}
	
	exec { "update $oracle::user umask":
	  command => "sed -i 's/^umask [0-9]\\{3,4\\}/umask 022/' .bash_profile",
	  cwd => "/home/$oracle::user",
	  provider => shell,
	  unless => 'grep -Fxq "umask 022" .bash_profile',
	  require => User["$oracle::user"]
	}

	exec { "add $oracle::user umask":
	  command => "sed -i '\$aumask 022' .bash_profile",
	  cwd => "/home/$oracle::user",
	  provider => shell,
	  unless => 'grep -Fxq "umask 022" .bash_profile',
	  require => [
	    User["$oracle::user"],
		Exec["update $oracle::user umask"],
	  ],
	}
}