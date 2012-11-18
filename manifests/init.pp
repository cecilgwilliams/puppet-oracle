class oracle(
	$mountPoint = "/u01",
	$user = "oracle",
	$group = "oinstall",
) {
	include stdlib
	
	$appBase = "${mountPoint}/app"
	$oracleInventory = "${appBase}/oraInventory"
	$oracleBase = "${appBase}/${user}"
	$dbHome = "${oracleBase}/product/11.2.0/dbhome_1"
	$dataHome = "${oracleBase}/oradata"
	$fastRecoveryHome = "${oracleBase}/fast_recovery_area"
	
	
	class { 'oracle::package': }
	-> class { 'oracle::users': }
	-> class { 'oracle::resources': }
	-> class { 'oracle::directories': }
	-> class { 'oracle::install': }
	-> class { 'oracle::postInstall': }
	
	anchor { 'oracle::begin': } ->  Class['oracle::package']
	Class['oracle::postInstall'] -> anchor { 'oracle::end': }
}
