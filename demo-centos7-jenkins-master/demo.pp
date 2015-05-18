exec { "/usr/bin/wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo" : 
	path => "/" 
} ->

exec { "/usr/bin/rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key" : 
	path => "/" 
} ->

package { [ 
	"httpd",
	"mariadb-server",
	"jenkins"
	] :
	ensure => installed,
	allow_virtual => true
} ->

service { "firewalld": 
	ensure => stopped,
	enable => false
} ->

service { "jenkins": 
	ensure => running,
	enable => true
}
