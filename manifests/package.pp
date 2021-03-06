class oracle::package {
	package { 
	  [
		"binutils.x86_64", 
		"compat-libcap1.x86_64", 
		"compat-libstdc++-33.x86_64",
		"compat-libstdc++-33.i686",
		"gcc.x86_64",
		"gcc-c++.x86_64",
		"glibc.x86_64",
		"glibc.i686",  
		"glibc-devel.x86_64",
		"glibc-devel.i686",
		"ksh.x86_64",
		"libgcc.x86_64",
		"libgcc.i686",
		"libstdc++.x86_64",
		"libstdc++.i686",
		"libstdc++-devel.x86_64",
		"libstdc++-devel.i686",
		"libaio.x86_64",
		"libaio.i686",
		"libaio-devel.x86_64",
		"libaio-devel.i686",
		"make.x86_64",
		"sysstat.x86_64",
	  ]:

	  ensure => installed
	}
	
	package {
	  [
	    "unzip.x86_64",
      ]:
	  
	  ensure => installed
	}
}