package { [ 
	"httpd",
	"mariadb-server",
	"corosync",
	"pacemaker",
	"pcs"
	] :
	ensure => installed,
	allow_virtual => true
}
