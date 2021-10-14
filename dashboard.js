var express = require('express')
var app = express()

var bodyParser = require('body-parser')
var mysql = require('mysql')
var path = require('path');
var moment = require('moment');
/**
 * This middleware provides a consistent API
 * for MySQL connections during request/response life cycle
 */
var myConnection = require('express-myconnection')
/**
 * Store database credentials in a separate config.js file
 * Load the file/module and its values
 */
var config = require('./config')
var dbOptions = {
	host: config.database.host,
	user: config.database.user,
	password: config.database.password,
	port: config.database.port,
	database: config.database.db
}
global.base_url = config.base.url;
global.username = '';



// connect to database
// mc.connect();
/**
 * 3 strategies can be used
 * single: Creates single database connection which is never closed.
 * pool: Creates pool of connections. Connection is auto release when response ends.
 * request: Creates new connection per new request. Connection is auto close when response ends.
 */
app.use(myConnection(mysql, dbOptions, 'pool'))

/**
 * setting up the templating view engine
 */
app.set('views', path.join(__dirname, 'app/views'));
app.set('view engine', 'ejs')
app.locals.moment = require('moment');
/**
 * import routes/index.js
 * import routes/users.js
 */



/**
 * Express Validator Middleware for Form Validation
 */
var expressValidator = require('express-validator')
app.use(expressValidator())


/**
 * body-parser module is used to read HTTP POST data
 * it's an express middleware that reads form's input
 * and store it as javascript object
 */

/**
 * bodyParser.urlencoded() parses the text as URL encoded data
 * (which is how browsers tend to send form data from regular forms set to POST)
 * and exposes the resulting object (containing the keys and values) on req.body.
 */
app.use(bodyParser.urlencoded({ extended: true, limit: '50mb', parameterLimit: 1000000 }))

app.use(bodyParser.json())
// app.use(express.bodyParser({limit: '50mb'}));

/**
 * This module let us use HTTP verbs such as PUT or DELETE
 * in places where they are not supported
 */
var methodOverride = require('method-override')

/**
 * using custom logic to override method
 *
 * there are other ways of overriding as well
 * like using header & using query value
 */
app.use(methodOverride(function (req, res) {
	var fullUrl = req.protocol + '://' + req.get('host') + req.originalUrl;
	// console.log(fullUrl);
	if (req.body && typeof req.body === 'object' && '_method' in req.body) {

		// look in urlencoded POST bodies and delete it
		var method = req.body._method
		delete req.body._method
		return method
	}
}))

/**
 * This module shows flash messages
 * generally used to show success or error messages
 *
 * Flash messages are stored in session
 * So, we also have to install and use
 * cookie-parser & session modules
 */
var flash = require('express-flash')
var cookieParser = require('cookie-parser');
var session = require('express-session');
var MySQLStore = require('express-mysql-session')(session);
dbOptions.schema = {
	tableName: 'custom_sessions_table_name',
	columnNames: {
		session_id: 'custom_session_id',
		expires: 'custom_expires_column_name',
		data: 'custom_data_column_name'
	}
}
var sessionStore = new MySQLStore(dbOptions);
app.set('trust proxy', 1);
app.use(cookieParser())
app.use(session({
	key: 'session_cookie_name',
	secret: 'session_cookie_secret',
	store: sessionStore,
	resave: false,
	saveUninitialized: false
}));



app.use(function (req, res, next) {
	if (req.session.user !== undefined) {
		req.getConnection(function (error, conn) {
			conn.query("select * from tbl_employee WHERE id = ?", [req.session.user.employee_id], function (err, employee) {
				if (err) {
					console.log("error: ", err);
				} else {
					global.employee_data = employee[0];
					next();
				}
			})
		})
	} else {
		next();
	}
})

app.use(flash())




app.use('/public', express.static('public'));



var routes = require('./app/routes/appRoutes'); //importing route
routes(app); //register the route

var common = require('./app/common/common');
var commonFiles = common.commonCssFiles();
app.use((req, res, next) => {
	// console.log('commnin-here1 ' + res.statusCode)
	var title = 'Not Found';
	var page = 'error-404';
	if (res.statusCode == 404) {
		title = 'Not Found';
		page = 'error-404';
	} else if (res.statusCode == 403) {
		title = 'Forbidden';
		page = 'error-403';
	}

	res.status(res.statusCode).render(page, {
		title: title,
		page_name: 'notFound',
		sessionData: req.session.user,
		commonCss: commonFiles[0],
		commonJs: commonFiles[1],
		base_url: config.base.url,
		cdnCSS: [],
		cdnJs: [],
		csslinks: [],
		jslinks: []
	})
})

app.listen(config.server.port, function () {
	console.log('Server running at port 3000: http://127.0.0.1:3000')
})
