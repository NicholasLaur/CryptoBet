
<%@ page contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>CryptoBet</title>

<link rel="shortcut icon" href="favicon.ico">

<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700,900'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/superfish.css">

<link rel="stylesheet" href="css/style.css">
<script src="js/modernizr-2.6.2.min.js"></script>
<script src="js/OperazioniConto.js"></script>
</head>
<body>
	<div id="fh5co-wrapper">
		<div id="fh5co-page">
			<div id="fh5co-header">
				<header id="fh5co-header-section"> <c:if
					test="${loggato!=null}">
					<div class="info">
						<div class="col-sm-5">
							<span id="messaggio" class="btn col-sm-6"> ${mex} </span>
						</div>
						<span class="col-sm-5"> <c:if test="${utente==\"USER\"}">
								<h2>
									<a href="MioConto.jsp" class="btn" id="saldoConto">Saldo
										conto : ${loggato.conto.saldo}</a>
								</h2>
							</c:if>
						</span>
						<div class="col-sm-2">
							<span class="col-sm-6"> <a href="login"><input
									type="button" class="btn btn-primary" value=LOG-OUT
									onclick="<c:set var="page" value="MioConto.jsp" scope="session"  />"></a>
							</span>
						</div>
					</div>
				</c:if>
				<div class="container">
					<div class="nav-header">
						<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"><i></i></a>
						<h1 id="fh5co-logo">
							<a href="index.jsp">Crypto<span>Bet</span></a>
						</h1>
						<!-- START #fh5co-menu-wrap -->
						<nav id="fh5co-menu-wrap" role="navigation">
						<ul class="sf-menu" id="fh5co-primary-menu">
							<li><a href="index.jsp">Home</a></li>
							<li><a href="scommetti">Scommesse</a></li>
							<li><a href="MioConto.jsp">Il Mio Conto</a></li>
							<li><a href="gestisciPartite.jsp"> Gestisci Partite</a></li>
							<li><a href="SquadreCampionati.jsp">Tutte le squadre</a></li>
							<li><a href="contact.html">Informazioni su di noi</a></li>
						</ul>
						</nav>
					</div>
				</div>
				</header>
			</div>
			<!-- end:fh5co-header -->
			<div class="fh5co-parallax"
				style="background-image: url(images/home-image-5.jpg);"
				data-stellar-background-ratio=\"0.5\">
				<div class="overlay"></div>
				<div class="container">
					<div class="row">
						<div
							class="col-md-8 col-md-offset-2 col-sm-12 col-sm-offset-0 col-xs-12 col-xs-offset-0 text-center fh5co-table">
							<div class="fh5co-intro fh5co-table-cell animate-box">
								<c:if test="${utente==\"USER\"}">
									<h1 class="text-center">Benvenuto</h1>
									<p class="label">Qui potrai gestire il tuo conto</p>
								</c:if>
								<c:if test="${utente==null}">
									<div>
										<br> <br> <br> <br>
										<div class="col-sm-6">
											<h1>Accedi al tuo conto</h1>
										</div>
										<div class="col-sm-6">
											<form method="post" action="login">
												<div class="form-group">
													<label for="user" class="label"> Username: </label> <input
														type="text" class="form-control" name="user">
												</div>
												<div class="form-group">
													<label for="pwd" class="label"> Password: </label> <input
														type="password" class="form-control" name="pwd">
												</div>
												<div class="form-group">
													<input class="btn btn-primary" type="submit" name="accesso"
														value="Accedi"
														onclick="<c:set var="page" value="MioConto.jsp" scope="session"/>" />
													<a class="btn btn-primary" href="Registrati.html"
														onclick="<c:set var="page" value="MioConto.jsp" scope="session"/>">Registrati</a>
												</div>
											</form>
										</div>
									</div>
								</c:if>
								<c:if test="${utente==\"ADMIN\"}">
									<div>
										<span class="btn btn-danger"> Errore: Effettua il login
											come cliente</span>
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end: fh5co-parallax -->
		<!-- end:fh5co-hero -->
		<div id="fh5co-schedule-section" class="fh5co-lightgray-section">
			<c:if test="${utente==\"USER\"}">
				<div class="container" id="operazioni">
					<div class="row">
						<div class="col-md-8 col-md-offset-2">
							<div class="heading-section text-center animate-box">
								<h2>Operazioni :</h2>
							</div>
						</div>
					</div>
					<div class="row animate-box">
						<div class="row text-center">

							<div class="col-md-12 schedule-container">

								<div class="schedule-content active">
									<div class="col-md-3 col-sm-6">
										<div class="program program-schedule"
											onclick="effettuaVersamento()">
											<img src="images/Versa.png" alt="Cycling">
											<h3>Effettua Versamento</h3>
										</div>
									</div>
									<div class="col-md-3 col-sm-6">
										<div class="program program-schedule"
											onclick="effettuaPrelievo()">
											<img src="images/Preleva.png" alt="">
											<h3>Effettua Prelievo</h3>
										</div>
									</div>
									<div class="col-md-3 col-sm-6">
										<div class="program program-schedule"
											onclick="mostraUltimeScommesse()">
											<img src="images/listaPartite.png" alt="">
											<h3>Lista Ultime Scommesse</h3>
										</div>
									</div>
									<div class="col-md-3 col-sm-6">
										<div class="program program-schedule"
											onclick="getListaMovimenti()">
											<img src="images/listaMovimenti.png" alt="Cycling">
											<h3>Lista Ultimi Movimenti</h3>
										</div>
									</div>
								</div>
								<!-- END sched-content -->
							</div>
						</div>
					</div>
				</div>
			</c:if>
			<div class="row">
				<div class="col-sm-2"></div>
				<div class="col-sm-8" id="response"></div>
				<div class="col-sm-2"></div>
			</div>
		</div>
		<footer>
		<div id="footer">
			<div class="container">
				<div class="row">
					<div class="col-md-4 animate-box">
						<h3 class="section-title">About Us</h3>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia and Consonantia, there live the blind texts.
							Separated they live in Bookmarksgrove right at the coast of the
							Semantics.</p>
					</div>

					<div class="col-md-4 animate-box">
						<h3 class="section-title">Our Address</h3>
						<ul class="contact-info">
							<li><i class="icon-map-marker"></i>198 West 21th Street,
								Suite 721 New York NY 10016</li>
							<li><i class="icon-phone"></i>+ 1235 2355 98</li>
							<li><i class="icon-envelope"></i><a href="#">info@yoursite.com</a></li>
							<li><i class="icon-globe2"></i><a href="#">www.yoursite.com</a></li>
						</ul>
					</div>
					<div class="col-md-4 animate-box">
						<h3 class="section-title">Drop us a line</h3>
						<form class="contact-form">
							<div class="form-group">
								<label for="name" class="sr-only">Name</label> <input
									type="name" class="form-control" id="name" placeholder="Name">
							</div>
							<div class="form-group">
								<label for="email" class="sr-only">Email</label> <input
									type="email" class="form-control" id="email"
									placeholder="Email">
							</div>
							<div class="form-group">
								<label for="message" class="sr-only">Message</label>
								<textarea class="form-control" id="message" rows="7"
									placeholder="Message"></textarea>
							</div>
							<div class="form-group">
								<input type="submit" id="btn-submit"
									class="btn btn-send-message btn-md" value="Send Message">
							</div>
						</form>
					</div>
				</div>
				<div class="row copy-right">
					<div class="col-md-6 col-md-offset-3 text-center">
						<p class="fh5co-social-icons">
							<a href="#"><i class="icon-twitter2"></i></a> <a href="#"><i
								class="icon-facebook2"></i></a> <a href="#"><i
								class="icon-instagram"></i></a> <a href="#"><i
								class="icon-dribbble2"></i></a> <a href="#"><i
								class="icon-youtube"></i></a>
						</p>
						<p>
							Copyright 2016 Free Html5 <a href="#">Fitness</a>. All Rights
							Reserved. <br>Made with <i class="icon-heart3"></i> by <a
								href="http://freehtml5.co/" target="_blank">Freehtml5.co</a> /
							Demo Images: <a href="https://unsplash.com/" target="_blank">Unsplash</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		</footer>


	</div>
	<!-- END fh5co-page -->

	</div>
	<!-- END fh5co-wrapper -->



	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/hoverIntent.js"></script>
	<script src="js/superfish.js"></script>

	<script src="js/main.js"></script>

</body>
</html>
