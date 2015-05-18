package { [ 
	"httpd",
	"mariadb-server" 
	] :
	ensure => installed,
	allow_virtual => true
}
