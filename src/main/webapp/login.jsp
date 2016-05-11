<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Login Page</title>
	 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	 <link rel="stylesheet" type="text/css" href="css/style.css"/> 
	 <link type="text/css" href="./css/bootstrap.css" rel="stylesheet" />
	 
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
</head>

<body>

<form method="post" action="LoginServlet">

<div class="container">
    <div class="row vertical-offset-100">
    	<div class="col-md-4 col-md-offset-4">
    		<div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h3 class="panel-title">Please sign in</h3>
			 	</div>
			  	<div class="panel-body">
			    	<form accept-charset="UTF-8" role="form">
                    <fieldset>
			    	  	<div class="form-group">
			    	  		<div class="input-group">
			    	  		<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
			    		    <input class="form-control" placeholder="Login" name="userId" type="text">
			    		    </div>
			    		</div>
			    		<div class="form-group">
			    			<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
			    				<input class="form-control" placeholder="Password" name="password" type="password" value="">
			    		</div>
			    		</div>
			    		<input class="btn btn-success btn-block" type="submit" value="Login">
			    		<a href="register.jsp" class="btn btn-primary btn-block active" role="button">Register Me</a>

			    	</fieldset>
			      	</form>
			    </div>
			</div>
		</div>
	</div>
</form>
</body>
</html>
