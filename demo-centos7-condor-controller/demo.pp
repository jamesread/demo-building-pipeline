package { [ 
	"httpd",
	"mariadb-server",
	"condor"
	] :
	ensure => installed,
	allow_virtual => true
}

augeas { "condor_config":                                                          
    changes => [                                                                   
		"set CONDOR_HOST 127.0.0.1",                                           
		"set START TRUE"                                               
	],                                                         
	lens => "Simplevars.lns",                              
	incl => "/etc/condor/config.d/00personal_condor.config",
} ~>                                                                               
                                                                                   
service { "condor":                                                                
    ensure => "running",                                                           
}  
