#!/bin/sh

/vagrant/manifests/modules/oracle/files/database/runInstaller -silent -waitforcompletion -responseFile /tmp/oracleMedia/db_install.rsp

touch /u01/app/oraInventory/11gr2.done


