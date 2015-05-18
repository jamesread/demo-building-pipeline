exec { "sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo" : }
exec { "sudo rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key" : }

package { [ 
	"httpd",
	"mariadb-server" 
	] :
	ensure => installed,
	allow_virtual => true
}
