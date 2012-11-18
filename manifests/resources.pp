class oracle::resources {
	sysctl::conf {
	  "fs.aio-max-nr": value => 1048576;
	  "fs.file-max": value => 6815744;
	  "kernel.shmall": value => 2097152;
	  "kernel.shmmax": value => 4294967295;
	  "kernel.shmmni": value => 4096;
	  "kernel.sem": value => '250 32000 100 128';
	  "net.ipv4.ip_local_port_range": value => '9000 65500';
	  "net.core.rmem_default": value => 262144;
	  "net.core.rmem_max": value => 4194304;
	  "net.core.wmem_default": value => 262144;
	  "net.core.wmem_max": value => 1048586;
	}

	limits::conf {
	  "$oracle::user-soft-nproc": domain => $oracle::user, type => soft, item => nproc, value => 2047;
	  "$oracle::user-hard-nproc": domain => $oracle::user, type => hard, item => nproc, value => 16384;
	  "$oracle::user-soft-nofile": domain => $oracle::user, type => soft, item => nofile, value => 1024;
	  "$oracle::user-hard-nofile": domain => $oracle::user, type => hard, item => nofile, value => 65536;
	  "$oracle::user-soft-stack": domain => $oracle::user, type => soft, item => stack, value => 10240;
	}
}