exec { "wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo" : 
	path => "/" 
}
exec { "rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key" : 
	path => "/" 
}

package { [ 
	"httpd",
	"mariadb-server",
	"jenkins"
	] :
	ensure => installed,
	allow_virtual => true
}

service { "firewalld": 
	ensure => stopped,
	enabled => false
}

service { "jenkins": 
	ensure => started,
	enabled => true
}
