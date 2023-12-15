<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="com.project.entities.*"%>


<%
UserInfo user = (UserInfo) session.getAttribute("currUser");
if (user == null) {
	response.sendRedirect("login.jsp");
}
%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Disha Coaching Website</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free HTML Templates" name="keywords">
<meta content="Free HTML Templates" name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Handlee&family=Nunito&display=swap"
	rel="stylesheet">

<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">

<!-- Flaticon Font -->
<link href="lib/flaticon/font/flaticon.css" rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="css/style.css" rel="stylesheet">
</head>

<body>
	<!-- Navbar Start -->
	<div class="container-fluid bg-light position-relative shadow">
		<nav
			class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0 px-lg-5">
			<a href="" class="navbar-brand font-weight-bold text-secondary"
				style="font-size: 50px;"> <!-- <i class="flaticon-043-teddy-bear"></i> -->
				<i class='fas fa-book-reader' style='font-size: 36px'></i> <span
				class="text-primary">Disha PW</span>
			</a>
			<button type="button" class="navbar-toggler" data-toggle="collapse"
				data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-between"
				id="navbarCollapse">
				<div class="navbar-nav font-weight-bold mx-auto py-0">
					<a href="index.html" class="nav-item nav-link active">Home</a> <a
						href="about.html" class="nav-item nav-link">About</a> <a
						href="class.html" class="nav-item nav-link">Classes</a> <a
						href="team.html" class="nav-item nav-link">Teachers</a>
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-toggle="dropdown">Pages</a>
						<div class="dropdown-menu rounded-0 m-0">
							<a href="blog.html" class="dropdown-item">Blog Grid</a> <a
								href="single.jsp" class="dropdown-item">Blog Detail</a>
						</div>
					</div>
					<a href="contact.html" class="nav-item nav-link">Contact</a>
				</div>
				<a href="#!" data-toggle="modal" data-target="#profile-modal"
					class="btn btn-primary px-4"><%=user.getName()%></a> <a
					href="login.jsp" class="btn btn-primary px-4">Log Out</a>

			</div>
		</nav>
	</div>
	<!-- Navbar End -->

	<%
	Message m = (Message) session.getAttribute("msg");
	if (m != null) {
	%>

	<div class="alert <%=m.getCssclass()%>">
		<%=m.getContent()%>
	</div>

	<%
	}
	session.removeAttribute("msg");
	%>


	<!-- Modal -->
	<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header text-center">
					<h5 class="modal-title" id="exampleModalLabel">Disha PW</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img id="profileImage" src="pics/<%=user.getProfile()%>"
							style="border-radius: 50%; max-width: 150px;">
						<h5 class="modal-title mt-3" id="exampleModalLabel"><%=user.getName()%></h5>
						<!-- Details -->
						<div id="profile-detail">
							<table class="table">
								<tbody>
									<tr>
										<th scope="row">ID :</th>
										<td><%=user.getId()%></td>

									</tr>
									<tr>
										<th scope="row">Email :</th>
										<td><%=user.getEmail()%></td>
									</tr>


								</tbody>
							</table>
						</div>

						<!-- Profile Edit -->

						<div id="profile-edit" style="display: none">
							<h3 class="mt-3">Please Edit Carefully</h3>
							<form action="EditServlet" method="post"
								enctype="multipart/form-data">
								<table class="table">
									<tr>
										<td>ID :</td>
										<td><%=user.getId()%></td>
									</tr>

									<tr>
										<td>Email :</td>
										<td><input type="email" class="form-control"
											name="user_email" value="<%=user.getEmail()%>"></td>
									</tr>

									<tr>
										<td>Name :</td>
										<td><input type="name" class="form-control"
											name="user_name" value="<%=user.getName()%>"></td>
									</tr>

									<tr>
										<td>Password :</td>
										<td><input type="Password" class="form-control"
											name="user_password" value="<%=user.getPassword()%>"></td>
									</tr>

									<tr>
										<td>New profile pic :</td>
										<td><input type="file" name="image" class="form-control">
										</td>
									</tr>

								</table>
								<div class="container">
									<button type="submit" class="btn btn-outline-primary">Save</button>
								</div>

							</form>

						</div>


					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="edit-profile-button" type="button"
						class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
	</div>




	<!-- Header Start -->
	<div class="container-fluid bg-primary px-0 px-md-5 mb-5">
		<div class="row align-items-center px-3">
			<div class="col-lg-6 text-center text-lg-left">
				<h1 class="display-3 font-weight-bold text-white">New Approach
					to Success</h1>
				<p class="text-white mb-4">Sea ipsum kasd eirmod kasd magna, est
					sea et diam ipsum est amet sed sit. Ipsum dolor no justo dolor et,
					lorem ut dolor erat dolore sed ipsum at ipsum nonumy amet. Clita
					lorem dolore sed stet et est justo dolore.</p>
				<a href="" class="btn btn-secondary mt-1 py-3 px-5">Learn More</a>
			</div>
			<div class="col-lg-6 text-center text-lg-right">
				<img class="img-fluid mt-5" src="img/header.png" alt="">
			</div>
		</div>
	</div>
	<!-- Header End -->


	<!-- Facilities Start -->
	<div class="container-fluid pt-5">
		<div class="container pb-3">
			<div class="row">
				<div class="col-lg-4 col-md-6 pb-1">
					<div class="d-flex bg-light shadow-sm border-top rounded mb-4"
						style="padding: 30px;">
						<!--<i
							class="flaticon-050-fence h1 font-weight-normal text-primary mb-3"></i>-->
						<div class="pl-4">
							<i style='font-size: 24px' class='fas'>&#xf5da;</i>
							<h4>Library Facility</h4>
							<p class="m-0">Kasd labore kasd et dolor est rebum dolor ut,
								clita dolor vero lorem amet elitr vero...</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 pb-1">
					<div class="d-flex bg-light shadow-sm border-top rounded mb-4"
						style="padding: 30px;">
						<!-- <i class="flaticon-022-drum h1 font-weight-normal text-primary mb-3"></i> -->
						<i style='font-size: 24px' class='fas'>&#xf044;</i>
						<div class="pl-4">
							<h4>Hand Written Notes</h4>
							<p class="m-0">Kasd labore kasd et dolor est rebum dolor ut,
								clita dolor vero lorem amet elitr vero...</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 pb-1">
					<div class="d-flex bg-light shadow-sm border-top rounded mb-4"
						style="padding: 30px;">
						<!-- <i
							class="flaticon-030-crayons h1 font-weight-normal text-primary mb-3"></i>-->
						<div class="pl-4">
							<i style='font-size: 24px' class='far'>&#xf15c;</i>
							<h4>Sample Question Papers</h4>
							<p class="m-0">Kasd labore kasd et dolor est rebum dolor ut,
								clita dolor vero lorem amet elitr vero...</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 pb-1">
					<div class="d-flex bg-light shadow-sm border-top rounded mb-4"
						style="padding: 30px;">
						<!--  <i
							class="flaticon-017-toy-car h1 font-weight-normal text-primary mb-3"></i>-->
						<i style='font-size: 24px' class='fas'>&#xf303;</i>
						<div class="pl-4">
							<h4>Easy Doubt Solving</h4>
							<p class="m-0">Kasd labore kasd et dolor est rebum dolor ut,
								clita dolor vero lorem amet elitr vero...</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 pb-1">
					<div class="d-flex bg-light shadow-sm border-top rounded mb-4"
						style="padding: 30px;">
						<!--  <i
							class="flaticon-025-sandwich h1 font-weight-normal text-primary mb-3"></i>-->
						<i style='font-size: 24px' class='fas'>&#xf19d;</i>
						<div class="pl-4">
							<h4>Disciplined Culture</h4>
							<p class="m-0">Kasd labore kasd et dolor est rebum dolor ut,
								clita dolor vero lorem amet elitr vero...</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 pb-1">
					<div class="d-flex bg-light shadow-sm border-top rounded mb-4"
						style="padding: 30px;">
						<!--  <i
							class="flaticon-047-backpack h1 font-weight-normal text-primary mb-3"></i>-->
						<i style='font-size: 24px' class='far'>&#xf2bb;</i>
						<div class="pl-4">
							<h4>Professional Teachers</h4>
							<p class="m-0">Kasd labore kasd et dolor est rebum dolor ut,
								clita dolor vero lorem amet elitr vero...</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Facilities Start -->


	<!-- About Start -->
	<div class="container-fluid py-5">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-5">
					<img class="img-fluid rounded mb-5 mb-lg-0" src="img/about-1.jpg"
						alt="">
				</div>
				<div class="col-lg-7">
					<p class="section-title pr-5">
						<span class="pr-2">Learn About Us</span>
					</p>
					<h1 class="mb-4">Best Institute for your Future</h1>
					<p>Invidunt lorem justo sanctus clita. Erat lorem labore ea,
						justo dolor lorem ipsum ut sed eos, ipsum et dolor kasd sit ea
						justo. Erat justo sed sed diam. Ea et erat ut sed diam sea ipsum
						est dolor</p>
					<div class="row pt-2 pb-4">
						<div class="col-6 col-md-4">
							<img class="img-fluid rounded" src="img/about-2.jpg" alt="">
						</div>
						<div class="col-6 col-md-8">
							<ul class="list-inline m-0">
								<li class="py-2 border-top border-bottom"><i
									class="fa fa-check text-primary mr-3"></i>Labore eos amet dolor
									amet diam</li>
								<li class="py-2 border-bottom"><i
									class="fa fa-check text-primary mr-3"></i>Etsea et sit dolor
									amet ipsum</li>
								<li class="py-2 border-bottom"><i
									class="fa fa-check text-primary mr-3"></i>Diam dolor diam
									elitripsum vero.</li>
							</ul>
						</div>
					</div>
					<a href="" class="btn btn-primary mt-2 py-2 px-4">Learn More</a>
				</div>
			</div>
		</div>
	</div>
	<!-- About End -->


	<!-- Class Start -->
	<div class="container-fluid pt-5">
		<div class="container">
			<div class="text-center pb-2">
				<p class="section-title px-5">
					<span class="px-2">Institute Enviroment</span>
				</p>
				<h1 class="mb-4">Classes for Your Learning</h1>
			</div>
			<div class="row">
				<div class="col-lg-4 mb-5">
					<div class="card border-0 bg-light shadow-sm pb-2">
						<img class="card-img-top mb-2" src="img/class-1.jpg" alt="">
						<div class="card-body text-center">
							<h4 class="card-title">Lecture Class</h4>
							<p class="card-text">Justo ea diam stet diam ipsum no sit,
								ipsum vero et et diam ipsum duo et no et, ipsum ipsum erat duo
								amet clita duo</p>
						</div>
						<div class="card-footer bg-transparent py-4 px-5">
							<div class="row border-bottom">
								<div class="col-6 py-1 text-right border-right">
									<strong>Class</strong>
								</div>
								<div class="col-6 py-1">9th to 12th</div>
							</div>
							<div class="row border-bottom">
								<div class="col-6 py-1 text-right border-right">
									<strong>Total Seats</strong>
								</div>
								<div class="col-6 py-1">100 Seats</div>
							</div>
							<div class="row border-bottom">
								<div class="col-6 py-1 text-right border-right">
									<strong>Class Time</strong>
								</div>
								<div class="col-6 py-1">10:00-05:00</div>
							</div>
							<div class="row">
								<div class="col-6 py-1 text-right border-right">
									<strong>Tution Fee</strong>
								</div>
								<div class="col-6 py-1">₹1000 /Subject</div>
							</div>
						</div>
						<a href="" class="btn btn-primary px-4 mx-auto mb-4">Join Now</a>
					</div>
				</div>
				<div class="col-lg-4 mb-5">
					<div class="card border-0 bg-light shadow-sm pb-2">
						<img class="card-img-top mb-2" src="img/class-2.jpg" alt="">
						<div class="card-body text-center">
							<h4 class="card-title">Library Room</h4>
							<p class="card-text">Justo ea diam stet diam ipsum no sit,
								ipsum vero et et diam ipsum duo et no et, ipsum ipsum erat duo
								amet clita duo</p>
						</div>
						<div class="card-footer bg-transparent py-4 px-5">
							<div class="row border-bottom">
								<div class="col-6 py-1 text-right border-right">
									<strong>Class</strong>
								</div>
								<div class="col-6 py-1">9th to 12th</div>
							</div>
							<div class="row border-bottom">
								<div class="col-6 py-1 text-right border-right">
									<strong>Total Seats</strong>
								</div>
								<div class="col-6 py-1">40 Seats</div>
							</div>
							<div class="row border-bottom">
								<div class="col-6 py-1 text-right border-right">
									<strong>Class Time</strong>
								</div>
								<div class="col-6 py-1">10:00 - 05:00</div>
							</div>
							<div class="row">
								<div class="col-6 py-1 text-right border-right">
									<strong>Tution Fee</strong>
								</div>
								<div class="col-6 py-1">₹300 / Month</div>
							</div>
						</div>
						<a href="" class="btn btn-primary px-4 mx-auto mb-4">Join Now</a>
					</div>
				</div>
				<div class="col-lg-4 mb-5">
					<div class="card border-0 bg-light shadow-sm pb-2">
						<img class="card-img-top mb-2" src="img/class-3.jpg" alt="">
						<div class="card-body text-center">
							<h4 class="card-title">Computer Lab</h4>
							<p class="card-text">Justo ea diam stet diam ipsum no sit,
								ipsum vero et et diam ipsum duo et no et, ipsum ipsum erat duo
								amet clita duo</p>
						</div>
						<div class="card-footer bg-transparent py-4 px-5">
							<div class="row border-bottom">
								<div class="col-6 py-1 text-right border-right">
									<strong>Class</strong>
								</div>
								<div class="col-6 py-1">9th to 12th</div>
							</div>
							<div class="row border-bottom">
								<div class="col-6 py-1 text-right border-right">
									<strong>Total Seats</strong>
								</div>
								<div class="col-6 py-1">40 Seats</div>
							</div>
							<div class="row border-bottom">
								<div class="col-6 py-1 text-right border-right">
									<strong>Class Time</strong>
								</div>
								<div class="col-6 py-1">10:00 - 05:00</div>
							</div>
							<div class="row">
								<div class="col-6 py-1 text-right border-right">
									<strong>Tution Fee</strong>
								</div>
								<div class="col-6 py-1">₹400 / Month</div>
							</div>
						</div>
						<a href="" class="btn btn-primary px-4 mx-auto mb-4">Join Now</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Class End -->


	<!-- Registration Start -->
	<div class="container-fluid py-5">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-7 mb-5 mb-lg-0">
					<p class="section-title pr-5">
						<span class="pr-2">Book A Seat</span>
					</p>
					<h1 class="mb-4">Book A Demo Session Here.</h1>
					<p>Invidunt lorem justo sanctus clita. Erat lorem labore ea,
						justo dolor lorem ipsum ut sed eos, ipsum et dolor kasd sit ea
						justo. Erat justo sed sed diam. Ea et erat ut sed diam sea ipsum
						est dolor</p>
					<ul class="list-inline m-0">
						<li class="py-2"><i class="fa fa-check text-success mr-3"></i>Labore
							eos amet dolor amet diam</li>
						<li class="py-2"><i class="fa fa-check text-success mr-3"></i>Etsea
							et sit dolor amet ipsum</li>
						<li class="py-2"><i class="fa fa-check text-success mr-3"></i>Diam
							dolor diam elitripsum vero.</li>
					</ul>
					<a href="" class="btn btn-primary mt-4 py-2 px-4">Book Now</a>
				</div>
				<div class="col-lg-5">
					<div class="card border-0">
						<div class="card-header bg-secondary text-center p-4">
							<h1 class="text-white m-0">Book A Seat</h1>
						</div>
						<div class="card-body rounded-bottom bg-primary p-5">
							<form action="BookDemoServlet" method="POST">
								<%
								Message m1 = (Message) session.getAttribute("msg");
								if (m1 != null) {
								%>

								<div class="success <%=m1.getCssclass()%>">
									<%=m1.getContent()%>
								</div>

								<%
								}
								session.removeAttribute("msg");
								%>

								<div class="form-group">
									<input type="text" class="form-control border-0 p-4"
										placeholder="Your Name" required="required" />
								</div>
								<div class="form-group">
									<input type="email" class="form-control border-0 p-4"
										placeholder="Your Email" required="required" />
								</div>
								<div class="form-group">
									<select class="custom-select border-0 px-4"
										style="height: 47px;">
										<option selected>Select A Class</option>
										<option value="1">Class 9th</option>
										<option value="2">Class 10th</option>
										<option value="3">Class 11th</option>
										<option value="4">Class 12th</option>
									</select>
								</div>
								<div class="form-group">
									<select class="custom-select border-0 px-4"
										style="height: 47px;">
										<option selected>Select Subjects</option>
										<option value="1">Math</option>
										<option value="2">Physics</option>
										<option value="3">Chemistry</option>
										<option value="4">Biology</option>
									</select>
								</div>
								<div>
									<button class="btn btn-secondary btn-block border-0 py-3"
										type="submit">Book Now</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Registration End -->


	<!-- Team Start -->
	<div class="container-fluid pt-5">
		<div class="container">
			<div class="text-center pb-2">
				<p class="section-title px-5">
					<span class="px-2">Our Teachers</span>
				</p>
				<h1 class="mb-4">Meet Our Teachers</h1>
			</div>
			<div class="row">
				<div class="col-md-6 col-lg-3 text-center team mb-5">
					<div class="position-relative overflow-hidden mb-4"
						style="border-radius: 100%;">
						<img class="img-fluid w-100" src="img/team-1.jpg" alt="">
						<div
							class="team-social d-flex align-items-center justify-content-center w-100 h-100 position-absolute">
							<a class="btn btn-outline-light text-center mr-2 px-0"
								style="width: 38px; height: 38px;" href="#"><i
								class="fab fa-twitter"></i></a> <a
								class="btn btn-outline-light text-center mr-2 px-0"
								style="width: 38px; height: 38px;" href="#"><i
								class="fab fa-facebook-f"></i></a> <a
								class="btn btn-outline-light text-center px-0"
								style="width: 38px; height: 38px;" href="#"><i
								class="fab fa-linkedin-in"></i></a>
						</div>
					</div>
					<h4>Manish Sir</h4>
					<i>Maths Teacher</i>
				</div>
				<div class="col-md-6 col-lg-3 text-center team mb-5">
					<div class="position-relative overflow-hidden mb-4"
						style="border-radius: 100%;">
						<img class="img-fluid w-100" src="img/team-2.jpg" alt="">
						<div
							class="team-social d-flex align-items-center justify-content-center w-100 h-100 position-absolute">
							<a class="btn btn-outline-light text-center mr-2 px-0"
								style="width: 38px; height: 38px;" href="#"><i
								class="fab fa-twitter"></i></a> <a
								class="btn btn-outline-light text-center mr-2 px-0"
								style="width: 38px; height: 38px;" href="#"><i
								class="fab fa-facebook-f"></i></a> <a
								class="btn btn-outline-light text-center px-0"
								style="width: 38px; height: 38px;" href="#"><i
								class="fab fa-linkedin-in"></i></a>
						</div>
					</div>
					<h4>Pankaj Sir</h4>
					<i>Chemistry Teacher</i>
				</div>
				<div class="col-md-6 col-lg-3 text-center team mb-5">
					<div class="position-relative overflow-hidden mb-4"
						style="border-radius: 100%;">
						<img class="img-fluid w-100" src="img/team-3.jpg" alt="">
						<div
							class="team-social d-flex align-items-center justify-content-center w-100 h-100 position-absolute">
							<a class="btn btn-outline-light text-center mr-2 px-0"
								style="width: 38px; height: 38px;" href="#"><i
								class="fab fa-twitter"></i></a> <a
								class="btn btn-outline-light text-center mr-2 px-0"
								style="width: 38px; height: 38px;" href="#"><i
								class="fab fa-facebook-f"></i></a> <a
								class="btn btn-outline-light text-center px-0"
								style="width: 38px; height: 38px;" href="#"><i
								class="fab fa-linkedin-in"></i></a>
						</div>
					</div>
					<h4>Alakh pandey</h4>
					<i>Physics Teacher</i>
				</div>
				<div class="col-md-6 col-lg-3 text-center team mb-5">
					<div class="position-relative overflow-hidden mb-4"
						style="border-radius: 100%;">
						<img class="img-fluid w-100" src="img/team-4.jpg" alt="">
						<div
							class="team-social d-flex align-items-center justify-content-center w-100 h-100 position-absolute">
							<a class="btn btn-outline-light text-center mr-2 px-0"
								style="width: 38px; height: 38px;" href="#"><i
								class="fab fa-twitter"></i></a> <a
								class="btn btn-outline-light text-center mr-2 px-0"
								style="width: 38px; height: 38px;" href="#"><i
								class="fab fa-facebook-f"></i></a> <a
								class="btn btn-outline-light text-center px-0"
								style="width: 38px; height: 38px;" href="#"><i
								class="fab fa-linkedin-in"></i></a>
						</div>
					</div>
					<h4>Amit Sir</h4>
					<i>Biology Teacher</i>
				</div>
			</div>
		</div>
	</div>
	<!-- Team End -->


	<!-- Testimonial Start -->
	<div class="container-fluid py-5">
		<div class="container p-0">
			<div class="text-center pb-2">
				<p class="section-title px-5">
					<span class="px-2">Testimonial</span>
				</p>
				<h1 class="mb-4">Toppers Of Our Institute</h1>
			</div>
			<div class="owl-carousel testimonial-carousel">
				<div class="testimonial-item px-3">
					<div class="bg-light shadow-sm rounded mb-4 p-4">
						<h3 class="fas fa-quote-left text-primary mr-3"></h3>
						Sed ea amet kasd elitr stet, stet rebum et ipsum est duo elitr
						eirmod clita lorem. Dolor tempor ipsum clita
					</div>
					<div class="d-flex align-items-center">
						<img class="rounded-circle" src="img/testimonial-1.jpg"
							style="width: 70px; height: 70px;" alt="Image">
						<div class="pl-3">
							<h5>Topper Name</h5>
							<i>Profession</i>
						</div>
					</div>
				</div>
				<div class="testimonial-item px-3">
					<div class="bg-light shadow-sm rounded mb-4 p-4">
						<h3 class="fas fa-quote-left text-primary mr-3"></h3>
						Sed ea amet kasd elitr stet, stet rebum et ipsum est duo elitr
						eirmod clita lorem. Dolor tempor ipsum clita
					</div>
					<div class="d-flex align-items-center">
						<img class="rounded-circle" src="img/testimonial-2.jpg"
							style="width: 70px; height: 70px;" alt="Image">
						<div class="pl-3">
							<h5>Topper Name</h5>
							<i>Profession</i>
						</div>
					</div>
				</div>
				<div class="testimonial-item px-3">
					<div class="bg-light shadow-sm rounded mb-4 p-4">
						<h3 class="fas fa-quote-left text-primary mr-3"></h3>
						Sed ea amet kasd elitr stet, stet rebum et ipsum est duo elitr
						eirmod clita lorem. Dolor tempor ipsum clita
					</div>
					<div class="d-flex align-items-center">
						<img class="rounded-circle" src="img/testimonial-3.jpg"
							style="width: 70px; height: 70px;" alt="Image">
						<div class="pl-3">
							<h5>Topper Name</h5>
							<i>Profession</i>
						</div>
					</div>
				</div>
				<div class="testimonial-item px-3">
					<div class="bg-light shadow-sm rounded mb-4 p-4">
						<h3 class="fas fa-quote-left text-primary mr-3"></h3>
						Sed ea amet kasd elitr stet, stet rebum et ipsum est duo elitr
						eirmod clita lorem. Dolor tempor ipsum clita
					</div>
					<div class="d-flex align-items-center">
						<img class="rounded-circle" src="img/testimonial-4.jpg"
							style="width: 70px; height: 70px;" alt="Image">
						<div class="pl-3">
							<h5>Parent Name</h5>
							<i>Profession</i>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Testimonial End -->


	<!-- Blog Start -->
	<div class="container-fluid pt-5">
		<div class="container">
			<div class="text-center pb-2">
				<p class="section-title px-5">
					<span class="px-2">Latest Blog</span>
				</p>
				<h1 class="mb-4">Latest Articles From Blog</h1>
			</div>
			<div class="row pb-3">
				<div class="col-lg-4 mb-4">
					<div class="card border-0 shadow-sm mb-2">
						<img class="card-img-top mb-2" src="img/blog-1.jpg" alt="">
						<div class="card-body bg-light text-center p-4">
							<h4 class="">Diam amet eos at no eos</h4>
							<div class="d-flex justify-content-center mb-3">
								<small class="mr-3"><i class="fa fa-user text-primary"></i>
									Admin</small> <small class="mr-3"><i
									class="fa fa-folder text-primary"></i> Web Design</small> <small
									class="mr-3"><i class="fa fa-comments text-primary"></i>
									15</small>
							</div>
							<p>Sed kasd sea sed at elitr sed ipsum justo, sit nonumy diam
								eirmod, duo et sed sit eirmod kasd clita tempor dolor stet
								lorem. Tempor ipsum justo amet stet...</p>
							<a href="" class="btn btn-primary px-4 mx-auto my-2">Read
								More</a>
						</div>
					</div>
				</div>
				<div class="col-lg-4 mb-4">
					<div class="card border-0 shadow-sm mb-2">
						<img class="card-img-top mb-2" src="img/blog-2.jpg" alt="">
						<div class="card-body bg-light text-center p-4">
							<h4 class="">Diam amet eos at no eos</h4>
							<div class="d-flex justify-content-center mb-3">
								<small class="mr-3"><i class="fa fa-user text-primary"></i>
									Admin</small> <small class="mr-3"><i
									class="fa fa-folder text-primary"></i> Web Design</small> <small
									class="mr-3"><i class="fa fa-comments text-primary"></i>
									15</small>
							</div>
							<p>Sed kasd sea sed at elitr sed ipsum justo, sit nonumy diam
								eirmod, duo et sed sit eirmod kasd clita tempor dolor stet
								lorem. Tempor ipsum justo amet stet...</p>
							<a href="" class="btn btn-primary px-4 mx-auto my-2">Read
								More</a>
						</div>
					</div>
				</div>
				<div class="col-lg-4 mb-4">
					<div class="card border-0 shadow-sm mb-2">
						<img class="card-img-top mb-2" src="img/blog-3.jpg" alt="">
						<div class="card-body bg-light text-center p-4">
							<h4 class="">Diam amet eos at no eos</h4>
							<div class="d-flex justify-content-center mb-3">
								<small class="mr-3"><i class="fa fa-user text-primary"></i>
									Admin</small> <small class="mr-3"><i
									class="fa fa-folder text-primary"></i> Web Design</small> <small
									class="mr-3"><i class="fa fa-comments text-primary"></i>
									15</small>
							</div>
							<p>Sed kasd sea sed at elitr sed ipsum justo, sit nonumy diam
								eirmod, duo et sed sit eirmod kasd clita tempor dolor stet
								lorem. Tempor ipsum justo amet stet...</p>
							<a href="" class="btn btn-primary px-4 mx-auto my-2">Read
								More</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Blog End -->


	<!-- Footer Start -->
	<div
		class="container-fluid bg-secondary text-white mt-5 py-5 px-sm-3 px-md-5">
		<div class="row pt-5">
			<div class="col-lg-3 col-md-6 mb-5">
				<a href=""
					class="navbar-brand font-weight-bold text-primary m-0 mb-4 p-0"
					style="font-size: 40px; line-height: 40px;"> <!-- <i class="flaticon-043-teddy-bear"></i> -->
					<i class='fas fa-book-reader' style='font-size: 36px'></i> <span
					class="text-white">Disha PW</span>
				</a>
				<p>Labore dolor amet ipsum ea, erat sit ipsum duo eos. Volup
					amet ea dolor et magna dolor, elitr rebum duo est sed diam elitr.
					Stet elitr stet diam duo eos rebum ipsum diam ipsum elitr.</p>
				<div class="d-flex justify-content-start mt-4">
					<a
						class="btn btn-outline-primary rounded-circle text-center mr-2 px-0"
						style="width: 38px; height: 38px;" href="#"><i
						class="fab fa-twitter"></i></a> <a
						class="btn btn-outline-primary rounded-circle text-center mr-2 px-0"
						style="width: 38px; height: 38px;" href="#"><i
						class="fab fa-facebook-f"></i></a> <a
						class="btn btn-outline-primary rounded-circle text-center mr-2 px-0"
						style="width: 38px; height: 38px;" href="#"><i
						class="fab fa-linkedin-in"></i></a> <a
						class="btn btn-outline-primary rounded-circle text-center mr-2 px-0"
						style="width: 38px; height: 38px;" href="#"><i
						class="fab fa-instagram"></i></a>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 mb-5">
				<h3 class="text-primary mb-4">Get In Touch</h3>
				<div class="d-flex">
					<h4 class="fa fa-map-marker-alt text-primary"></h4>
					<div class="pl-3">
						<h5 class="text-white">Address</h5>
						<p>Naka By Pass, Ayodhya</p>
					</div>
				</div>
				<div class="d-flex">
					<h4 class="fa fa-envelope text-primary"></h4>
					<div class="pl-3">
						<h5 class="text-white">Email</h5>
						<p>info@example.com</p>
					</div>
				</div>
				<div class="d-flex">
					<h4 class="fa fa-phone-alt text-primary"></h4>
					<div class="pl-3">
						<h5 class="text-white">Phone</h5>
						<p>+012 345 67890</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 mb-5">
				<h3 class="text-primary mb-4">Quick Links</h3>
				<div class="d-flex flex-column justify-content-start">
					<a class="text-white mb-2" href="#"><i
						class="fa fa-angle-right mr-2"></i>Home</a> <a class="text-white mb-2"
						href="#"><i class="fa fa-angle-right mr-2"></i>About Us</a> <a
						class="text-white mb-2" href="#"><i
						class="fa fa-angle-right mr-2"></i>Our Classes</a> <a
						class="text-white mb-2" href="#"><i
						class="fa fa-angle-right mr-2"></i>Our Teachers</a> <a
						class="text-white mb-2" href="#"><i
						class="fa fa-angle-right mr-2"></i>Our Blog</a> <a class="text-white"
						href="#"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
				</div>
			</div>
			<!--  <div class="col-lg-3 col-md-6 mb-5">
				<h3 class="text-primary mb-4">Newsletter</h3>
				<form action="">
					<div class="form-group">
						<input type="text" class="form-control border-0 py-4"
							placeholder="Your Name" required="required" />
					</div>
					<div class="form-group">
						<input type="email" class="form-control border-0 py-4"
							placeholder="Your Email" required="required" />
					</div>
					<div>
						<button class="btn btn-primary btn-block border-0 py-3"
							type="submit">Submit Now</button>
					</div>
				</form>
			</div>-->
		</div>
		<div class="container-fluid pt-5"
			style="border-top: 1px solid rgba(23, 162, 184, .2);">
			<p class="m-0 text-center text-white">
				&copy; <a class="text-primary font-weight-bold" href="#"> All
					Rights Reserved. Designed by <a
					class="text-primary font-weight-bold" href="https://htmlcodex.com">Arvind
						Sahu</a> , <a class="text-primary font-weight-bold"
					href="https://htmlcodex.com">Komal Srivastava</a> & <a
					class="text-primary font-weight-bold" href="https://htmlcodex.com">Devansh
						Srivastava</a>
			</p>
		</div>
	</div>
	<!-- Footer End -->


	<!-- Back to Top -->
	<a href="#" class="btn btn-primary p-3 back-to-top"><i
		class="fa fa-angle-double-up"></i></a>


	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="lib/isotope/isotope.pkgd.min.js"></script>
	<script src="lib/lightbox/js/lightbox.min.js"></script>

	<!-- Contact Javascript File -->
	<script src="mail/jqBootstrapValidation.min.js"></script>
	<script src="mail/contact.js"></script>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>

	<script>
		$(document).ready(function() {
			let editStatus = false;

			$('#edit-profile-button').click(function() {
				if (editStatus == false) {
					$("#profile-detail").hide();
					$("#profile-edit").show();
					editStatus = true;
					$(this).text("Back");
				} else {
					$("#profile-detail").show();
					$("#profile-edit").hide();
					editStatus = false;
					$(this).text("Edit");
				}
			});
		});
	</script>
</body>
</html>