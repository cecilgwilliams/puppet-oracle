class oracle::install {
  $serviceName = "vagrant.kalak451.net"
  $sid = "vagrant"
  $templateName = "General_Purpose.dbc"
  $password_sys = "manager"
  $password_system = "manager"
  $datafileLocation = "/u01/app/oracle/oradata"
  $fastRecoveryArea = "/u01/app/oracle/fast_recovery_area"
  $totalMemory = "1024"
  

  file { "/tmp/oracleMedia":
    ensure => directory,
	owner => "oracle",
	group => "oinstall"
  }
  -> file { "/tmp/oracleMedia/db_install.rsp":
    ensure => present,
	source => "puppet:///modules/oracle/db_install.rsp",
	owner => "oracle",
	group => "oinstall",
	mode => "700",
  }
  -> file { "/tmp/oracleMedia/installOracle.sh":
    ensure => present,
	source => "puppet:///modules/oracle/installOracle.sh",
	owner => "oracle",
	group => "oinstall",
	mode => "700",
  }
  -> exec { "install oracle":
    cwd => "/home/oracle",
	command => "/tmp/oracleMedia/installOracle.sh",
	creates => "/u01/app/oraInventory/11gr2.done",
	user => "oracle",
  }
  -> exec { "run oracle root script":
    cwd => "/u01/app/oracle/product/11.2.0/home",
	command => "/u01/app/oracle/product/11.2.0/home/root.sh",
	user => "root",
  }
  -> file { "/tmp/oracleMedia/netca.rsp":
    ensure => present,
	source => "puppet:///modules/oracle/netca.rsp",
	owner => "oracle",
	group => "oinstall",
	mode => "700",
  }
  -> exec { "run netca":
    cwd => "/home/oracle",
	environment => ["ORACLE_HOME=/u01/app/oracle/product/11.2.0/home", "USER=oracle"],
	command => "/u01/app/oracle/product/11.2.0/home/bin/netca /silent /responsefile /tmp/oracleMedia/netca.rsp",
	logoutput => on_failure,
	user => "oracle",
	group => "oinstall",
  }
  -> file { "/tmp/oracleMedia/dbca.rsp":
    ensure => present,
	content => template("oracle/dbca-createDatabase.erb"),
	owner => "oracle",
	group => "oinstall",
	mode => "700",
  }
  -> exec { "run dbca":
    cwd => "/home/oracle",
	environment => ["ORACLE_HOME=/u01/app/oracle/product/11.2.0/home", "USER=oracle"],
	command => "/u01/app/oracle/product/11.2.0/home/bin/dbca -silent -responsefile /tmp/oracleMedia/dbca.rsp",
	logoutput => on_failure,
	user => "oracle",
	group => "oinstall",
  }
}