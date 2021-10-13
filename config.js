var config = {
	database: {
		host:	  'localhost', 	// database host
		user: 	  'root', 		// your database username
		password: '', 		// your database password
		port: 	  3306, 		// default MySQL port
		db: 	  'techtic_demo' 		// your database name
	},
	server: {
		host: '127.0.0.1',
		port: '3000'
	},
	base:{
		url:'http://localhost:3000',
		booking:'http://localhost:3000/booking',
		api:'http://localhost:3000',
		api_key: '049wee3437423jutyn56ds95275345df.t56m0rfqfs535ad'
	}
}

module.exports = config
