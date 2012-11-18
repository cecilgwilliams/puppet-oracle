class oracle::directories {
	file { ["$oracle::mountPoint", "$oracle::appBase", "$oracle::oracleBase", "$oracle::dataHome", "$oracle::fastRecoveryHome"]:
	  ensure => directory,
	  owner => "$oracle::user",
	  group => "$oracle::group",
	  mode => "775",
	}
	
	file { "/etc/oraInst.loc":
		ensure => present,
		owner => "$oracle::user",
		group => "$oracle::group",
		mode => "664",
		content => template("oracle/oraInst.erb")
	}
}

