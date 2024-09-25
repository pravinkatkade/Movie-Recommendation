package org.techhub;

import java.util.List;
import java.util.Map;

import org.movie.recomendation.model.LoginModel;
import org.movie.recomendation.model.MovieDetail;
import org.movie.recomendation.model.actorModel;
import org.movie.recomendation.model.genersModel;
import org.movie.recomendation.model.movieModel;
import org.movie.recomendation.model.userLoginModel;
import org.movie.recomendation.service.GenreService;
import org.movie.recomendation.service.actorService;
import org.movie.recomendation.service.adminService;
import org.movie.recomendation.service.movieService;
import org.movie.recomendation.service.userRegService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {

	@Autowired
	adminService aService;
	@Autowired
	movieService mService;

	@Autowired
	userRegService uregService;
	@Autowired
	GenreService gService;
	@Autowired
	actorService actService;

	@SuppressWarnings({ "unused", "rawtypes" })
	@RequestMapping("/")
	public String homePagee(Map<String, List> map, Model model) {
		List<genersModel> genres = gService.getAllGenres();
		List<movieModel> mmodel = mService.findAllMovieName();
		List<actorModel> amodel = actService.getAllActor();

		List<MovieDetail> movies = mService.getAllMovieDetails();
		model.addAttribute("movies", movies);

		List<MovieDetail> topRatedMovies = mService.getTopRatedMovies();
		model.addAttribute("topmovies", topRatedMovies);

		map.put("mList", mmodel);
		map.put("gList", genres);
		map.put("aList", amodel);
		return "index";
	}

	@GetMapping("/navbar")
	public String showDashboard(Model model, Map map) {
		List<genersModel> genres = gService.getAllGenres();
		List<actorModel> amodel = actService.getAllActor();
		map.put("gList", genres);
		map.put("aList", amodel);
		return "navbar"; // Ensure the correct JSP view name
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session, RedirectAttributes redirectAttributes, Model model) {

		session.invalidate();

		List<genersModel> genres = gService.getAllGenres();
		List<movieModel> mmodel = mService.findAllMovieName();
		List<actorModel> amodel = actService.getAllActor();
		List<MovieDetail> movies = mService.getAllMovieDetails();
		List<MovieDetail> topRatedMovies = mService.getTopRatedMovies();

		model.addAttribute("movies", movies);
		model.addAttribute("topmovies", topRatedMovies);
		model.addAttribute("gList", genres);
		model.addAttribute("aList", amodel);
		model.addAttribute("mList", mmodel);

		redirectAttributes.addFlashAttribute("message", "You have been logged out successfully.");

		return "index"; // Adjust according to your index page mapping
	}

	@RequestMapping(value = "/valid")
	public String validateUser(LoginModel model, Model model1) {
		boolean isValidUser = aService.isValidateUser(model);

		if (isValidUser) {
			// Fetch the list of users and movies
			List<userLoginModel> users = uregService.getAllUser();
			model1.addAttribute("users", users);
			List<genersModel> genres = gService.getAllGenres(); // Fetch all genres
			model1.addAttribute("genres", genres);

			List<MovieDetail> movies = uregService.getTopRatedMovies();
			model1.addAttribute("movies", movies); // Corrected attribute name
			List<actorModel> amodel = actService.getAllActor();
			model1.addAttribute("aList", amodel);
			return "superadminDashboard";
		} else {
			model1.addAttribute("error", "Invalid Username or Password");
			return "Adminlogin";
		}
	}
	// gener add=============================

	@RequestMapping(value = "genere", method = RequestMethod.POST)
	public String addGenere(genersModel genere, Map map, Model model) {
		boolean b = gService.isAddgeners(genere);

		if (b) {
			List<userLoginModel> users = uregService.getAllUser();
			model.addAttribute("users", users);
			List<MovieDetail> movies = uregService.getTopRatedMovies();
			model.addAttribute("movies", movies);
			List<genersModel> genres = gService.getAllGenres(); // Fetch all genres
			model.addAttribute("genres", genres);
			List<actorModel> amodel = actService.getAllActor();
			model.addAttribute("aList", amodel);
			map.put("msg", "Genere Added Successfully.");
		} else {
			map.put("msg", "Failed to Add Genere.");
		}

		return "superadminDashboard"; // Ensure this view exists
	}

	@GetMapping("/deletecat")
	public String deletecat(@RequestParam("cid") int cid, Model model) {
		gService.isDeletecat(cid);
		List<userLoginModel> users = uregService.getAllUser();
		model.addAttribute("users", users);
		List<MovieDetail> movie = uregService.getTopRatedMovies();
		model.addAttribute("movies", movie);
		List<genersModel> genres = gService.getAllGenres(); // Fetch all genres
		model.addAttribute("genres", genres);
		List<actorModel> amodel = actService.getAllActor();
		model.addAttribute("aList", amodel);
		return "superadminDashboard";
	}

	@RequestMapping("/viewcat")
	public String viewcat(Model model) {
		List<genersModel> genres = gService.getAllGenres(); // Fetch all genres
		model.addAttribute("genres", genres); // Add genres to the model
		return "superadminDashboard"; // Return the view
	}

//	============back admin==========
	@RequestMapping("/admindash")
	public String admin(Model model) {
		List<userLoginModel> users = uregService.getAllUser();
		model.addAttribute("users", users);
		List<genersModel> genres = gService.getAllGenres(); // Fetch all genres
		model.addAttribute("genres", genres);
		List<MovieDetail> movies = uregService.getTopRatedMovies();
		model.addAttribute("movies", movies);
		List<actorModel> amodel = actService.getAllActor();
		model.addAttribute("aList", amodel);
		return "superadminDashboard";
	}

	// Actor =========================

	@RequestMapping(value = "/actor", method = RequestMethod.POST)
	public String addActor(actorModel genere, Map map, Model model) {
		boolean b = actService.isAddActor(genere);

		if (b) {
			List<userLoginModel> users = uregService.getAllUser();
			model.addAttribute("users", users);
			List<MovieDetail> movies = uregService.getTopRatedMovies();
			model.addAttribute("movies", movies);
			List<genersModel> genres = gService.getAllGenres(); // Fetch all genres
			model.addAttribute("genres", genres);
			List<actorModel> amodel = actService.getAllActor();
			model.addAttribute("aList", amodel);
			model.addAttribute("msg", "Actor Added successfully!");
		}

		else {
			model.addAttribute("msg", "Actor Not Added successfully!");

		}
		return "superadminDashboard";
	}

	@GetMapping("/deleteactor")
	public String deleteActor(@RequestParam("aid") int aid, Model model) {
		actService.isDeleteactor(aid);
		List<userLoginModel> users = uregService.getAllUser();
		model.addAttribute("users", users);
		List<MovieDetail> movie = uregService.getTopRatedMovies();
		model.addAttribute("movies", movie);
		List<genersModel> genres = gService.getAllGenres(); // Fetch all genres
		model.addAttribute("genres", genres);
		List<actorModel> amodel = actService.getAllActor();
		model.addAttribute("aList", amodel);
		return "superadminDashboard";
	}

	// ------------------------user login logic==================

	@RequestMapping(value = "/uvalid")
	public String validateUser() {
		return "userlogin";
	}

	@RequestMapping(value = "/user-uvalid")
	public String validateUser(userLoginModel model, HttpSession session, Model model1, Map<String, List> map) {
		List<genersModel> genres = gService.getAllGenres();
		List<movieModel> mmodel = mService.findAllMovieName();
		List<actorModel> amodel = actService.getAllActor();

		List<MovieDetail> movies = mService.getAllMovieDetails();
		model1.addAttribute("movies", movies);
		List<MovieDetail> topRatedMovies = mService.getTopRatedMovies();
		model1.addAttribute("topRatedMovies", topRatedMovies);

		map.put("mList", mmodel);
		map.put("gList", genres);
		map.put("aList", amodel);

		boolean isValidUser = uregService.isValidate(model);

		if (isValidUser) {
			int userId = uregService.getUserId(model);
			String uname = model.getUsername();
			String upass = model.getPassword();

			// Set user details in the session
			session.setAttribute("userId", userId);
			session.setAttribute("uname", uname);
			session.setAttribute("upass", upass);

			return "userLoginDashboard";
		} else {
			model1.addAttribute("error", "Invalid Username or Password");
			return "userlogin";
		}
	}

	// ----------------------

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveData(movieModel model1, Map map) {
		boolean b = mService.isAddMovie(model1);

		if (b) {
			map.put("msg", "Movie Added Successfully.");
		} else {
			map.put("msg", "Movie was not added successfully.");
		}

		return "superadminDashboard";
	}

	@RequestMapping("/addmovie")
	public String Addmovie(Map<String, List> map) {
		List<genersModel> genres = gService.getAllGenres();
		List<actorModel> amodel = actService.getAllActor();

		map.put("gList", genres);
		map.put("aList", amodel);
		return "AddMovie";

	}

	@RequestMapping("/reg")
	public String RegUser() {
		return "registeruser";
	}

	@RequestMapping(value = "/ureg", method = RequestMethod.POST)
	public String saveRegUSer(userLoginModel model, Map<String, Object> map) {
		boolean isRegistered = uregService.isUserReg(model);

		if (isRegistered) {
			map.put("m", "User registered successfully.");
		} else {
			map.put("m", "User registration failed.");
		}

		return "userlogin"; // Make sure this page is userlogin.jsp
	}

	public List<movieModel> getAllMovies() {
		List<movieModel> list = mService.getAllMovies();
		return list;

	}

	@RequestMapping("/viewMovie")
	public String getAllMovies(Map<String, List<movieModel>> map) {
		map.put("mlist", this.getAllMovies());
		return "superadminDashboard";
	}

	@RequestMapping("/viewMovies")
	public String viewMovies(Model model) {
		List<MovieDetail> movies = mService.getAllMovieDetails();
		model.addAttribute("movies", movies);
		return "superadminDashboard"; // Your JSP page name
	}

	@RequestMapping("/view")
	public String view() {
		return "viewmovies";
	}

	@RequestMapping(value = "/deleteMovie", method = RequestMethod.POST)
	public String deleteMovie(@RequestParam("moviename") String moviename, Map<String, Object> map, Model model) {
		mService.isDeleteMovie(moviename);
//	    map.put("mlist", this.getAllMovies(map));
		List<userLoginModel> users = uregService.getAllUser();
		model.addAttribute("users", users);
		List<MovieDetail> movies = uregService.getTopRatedMovies();
		model.addAttribute("movies", movies);
		List<genersModel> genres = gService.getAllGenres(); // Fetch all genres
		model.addAttribute("genres", genres);
		List<actorModel> amodel = actService.getAllActor();
		model.addAttribute("aList", amodel);
		return "superadminDashboard";
	}

	// Add movie all details ---------------

	@RequestMapping(value = "/submitMovie", method = RequestMethod.POST)
	public String submitMovie(@ModelAttribute movieModel moviee, @RequestParam("moviename") String moviename,
			@RequestParam("movielang") String movielang, @RequestParam("movieyear") String movieyear,
			@RequestParam("movielink") String movielink, @RequestParam("gname") Integer gid,
			@RequestParam("aname") Integer aid, Model model) {

		// Create movie model object
		movieModel movie = new movieModel(moviename, movielang, movieyear, movielink);

		// Add movie and associated genre and actor
		boolean isAdded = mService.addMovie(movie, gid, aid);

		if (isAdded) {
			model.addAttribute("message", "Movie added successfully!");
		} else {
			model.addAttribute("message", "Failed to add the movie. Please try again.");
		}

		return "addMovie"; // Replace with the actual path to the page you want to redirect to
	}

	// ======================================search all feild

	@GetMapping("/searchMovie")
	public String searchMovie(@RequestParam(value = "movieId", required = false, defaultValue = "0") int movieId,
			@RequestParam(value = "moviename", required = false) String moviename,
			@RequestParam(value = "movielang", required = false) String movielang,
			@RequestParam(value = "moviecat", required = false) String moviecat,
			@RequestParam(value = "yearFrom", required = false) String yearFrom,
			@RequestParam(value = "yearTo", required = false) String yearTo, Model model) {
		List<MovieDetail> movieList = mService.searchMovies(movieId, moviename, movielang, moviecat, yearFrom, yearTo);

		model.addAttribute("movieList", movieList);
		List<userLoginModel> users = uregService.getAllUser();
		model.addAttribute("users", users);
		List<MovieDetail> movie = uregService.getTopRatedMovies();
		model.addAttribute("movies", movie);
		List<MovieDetail> movies = uregService.getTopRatedMovies();
		model.addAttribute("movies", movies);
		List<genersModel> genres = gService.getAllGenres(); // Fetch all genres
		model.addAttribute("genres", genres);
		List<actorModel> amodel = actService.getAllActor();
		model.addAttribute("aList", amodel);
		return "superadminDashboard"; // Ensure 'demo' is the correct JSP page name
	}

	// ========================update movie========================================

	@RequestMapping(value = "/updateMoviePage", method = RequestMethod.GET)
	public String showUpdateMoviePage(@RequestParam("movieId") int movieId, Map map) {
		MovieDetail movieDetail = mService.findById(movieId);
		if (movieDetail != null) {
			map.put("movieDetail", movieDetail);
			return "updateMoviePage";
		} else {
			return "viewmovies";
		}
	}

	@RequestMapping(value = "/updateMovie", method = RequestMethod.POST)
	public String updateMovie(@RequestParam(value = "movieId") int movieId,
			@RequestParam(value = "moviename", required = false) String moviename,
			@RequestParam(value = "movielang", required = false) String movielang,
			@RequestParam(value = "movielink", required = false) String movielink,

			@RequestParam(value = "gname", required = false) String gname,
			@RequestParam(value = "aname", required = false) String aname, Map map, Model model) {

		MovieDetail movieDetail = mService.findById(movieId);

		if (movieDetail == null) {
			List<genersModel> genres = gService.getAllGenres(); // Fetch all genres
			model.addAttribute("genres", genres);
			List<actorModel> amodel = actService.getAllActor();
			model.addAttribute("actors	", amodel);
			map.put("error", "Movie not found.");
			return "updateMoviePage?movieId=" + movieId;
		}

		movieModel movie = movieDetail.getMovie();
		if (moviename != null && !moviename.isEmpty()) {
			movie.setMoviename(moviename);
		}
		if (movielang != null && !movielang.isEmpty()) {
			movie.setMovielang(movielang);
		}
		if (movielink != null && !movielink.isEmpty()) {
			movie.setMovielink(movielink);
		}

		if (gname != null && !gname.isEmpty()) {
			genersModel genre = new genersModel();
			genre.setGname(gname);
			movieDetail.setGenre(genre);
		}
		if (aname != null && !aname.isEmpty()) {
			actorModel actor = new actorModel();
			actor.setAname(aname);
			movieDetail.setActor(actor);
		}

		mService.updateMovie(movieDetail);
		List<userLoginModel> users = uregService.getAllUser();
		model.addAttribute("users", users);
		List<MovieDetail> movies = uregService.getTopRatedMovies();
		model.addAttribute("movies", movies);
		List<genersModel> genres = gService.getAllGenres(); // Fetch all genres
		model.addAttribute("genres", genres);
		List<actorModel> amodel = actService.getAllActor();
		model.addAttribute("actors	", amodel);
		map.put("success", "Movie updated successfully!");
		return "superadminDashboard";
	}

	// =========================ffgjgheaarhdgf====================================

	// **************userModule******************************

	@GetMapping("/clickMovie")
	public String showMovieDetails(@RequestParam("id") int id, Map<String, Object> map, Model model) {
		MovieDetail movieDetail = mService.findById(id);
		map.put("movieDetail", movieDetail);
		List<genersModel> genres = gService.getAllGenres();
		List<actorModel> amodel = actService.getAllActor();

		map.put("gList", genres);
		map.put("aList", amodel);

		return "clickMovie";
	}

	@RequestMapping("/backindex")
	public String homePageee(Map<String, List> map, Model model) {
		List<genersModel> genres = gService.getAllGenres();
		List<movieModel> mmodel = mService.findAllMovieName();
		List<actorModel> amodel = actService.getAllActor();

		List<MovieDetail> movies = mService.getAllMovieDetails();
		model.addAttribute("movies", movies);
		List<MovieDetail> topRatedMovies = mService.getTopRatedMovies();
		model.addAttribute("topRatedMovies", topRatedMovies);

		map.put("mList", mmodel);
		map.put("gList", genres);
		map.put("aList", amodel);
		return "userLoginDashboard";
	}

//	find geners wise movies;==============
	@RequestMapping("/moviesByGenre")
	public String getMoviesByGenre(@RequestParam("genre") String genre, Model model, Map map) {
		List<MovieDetail> moviesByGenre = mService.getMoviesByGenre(genre);
		model.addAttribute("moviesByGenre", moviesByGenre);
		model.addAttribute("selectedGenre", genre);
		List<genersModel> genres = gService.getAllGenres();
		List<actorModel> amodel = actService.getAllActor();

		map.put("gList", genres);
		map.put("aList", amodel);
		return "moviesByGenre";
	}

//	=============================Watch Movie====================
	@RequestMapping("/watchMovie")
	public String WatchMovie(@RequestParam("movieId") int movieId, Model model) {
		System.out.println("in watch ");
		List<MovieDetail> movies = mService.getAllMovieDetails();
		model.addAttribute("movies", movies);

		return "watchMovie";
	}

	@PostMapping("/saveMovieUser")
	public String saveMovieUser(@RequestParam("userId") int userId, @RequestParam("movieId") int movieId,
			RedirectAttributes redirectAttributes, Model model, Map map) {
		// Insert movie and user association
		mService.insertMovieUser(userId, movieId);

		// Add attributes to redirect if needed (although in this case not necessary)
		redirectAttributes.addAttribute("movieId", movieId);
		redirectAttributes.addAttribute("userId", userId);
		List<genersModel> genres = gService.getAllGenres();
		List<actorModel> amodel = actService.getAllActor();

		map.put("gList", genres);
		map.put("aList", amodel);
		// Fetch all movie details
		List<MovieDetail> movies = mService.getAllMovieDetailss(movieId);

		// Add movies list to model to display in JSP
		model.addAttribute("movies", movies);

		// Return the actual view to display the movie details (no redirect)
		return "watchMovie";
	}

	@GetMapping("/watchMovie")
	public String watchMovie(@RequestParam("movieId") int movieId, @RequestParam("userId") int userId, Model model) {
		model.addAttribute("movieId", movieId);
		model.addAttribute("userId", userId);
		return "watchMovie";
	}

	@PostMapping("/submitReview")
	public String submitReview(@RequestParam("userId") int userId, @RequestParam("movieId") int movieId,
			@RequestParam("rating") int rating, @RequestParam("review") String review,
			RedirectAttributes redirectAttributes) {
		mService.insertRatingAndReview(userId, movieId, rating, review);

		redirectAttributes.addAttribute("movieId", movieId);
		redirectAttributes.addAttribute("userId", userId);
		return "redirect:/watchMovie";
	}

	@RequestMapping("/recommendations")
	public String getTopRatedMovies(Model model) {
		List<MovieDetail> topRatedMovies = mService.getTopRatedMovies();
//		        List<MovieDetail> movie = uregService.getTopRatedMovies();
//		        model.addAttribute("movies", movie);

		System.out.println("Top Rated Movies:");
		System.out.println("------------------------------------------------------");
		for (MovieDetail movie : topRatedMovies) {
			System.out.println("Movie Name: " + movie.getMovie().getMoviename());
			System.out.println("Genre: " + movie.getGenre().getGname());
			System.out.println("Actor: " + movie.getActor().getAname());
			System.out.println("Release Year: " + movie.getMovie().getMovieyear());
			System.out.println("Overall Rating: " + movie.getOverallRating());
			System.out.println("------------------------------------------------------");
		}

		model.addAttribute("topRatedMovies", topRatedMovies);

		return "index";
	}

	// index======================
//	@RequestMapping("/clickMoviee")
//	@ResponseBody
//	public ResponseEntity<String> searchMovies(@RequestParam("name") String movieName, HttpServletRequest request) {
//		List<MovieDetail> movieDetails = mService.searchMoviesByName(movieName);
//
//		if (movieDetails.isEmpty()) {
//			return ResponseEntity.ok("<p>No movies found for \"" + movieName + "\"</p>");
//		}
//
//		StringBuilder htmlResponse = new StringBuilder();
//		htmlResponse.append("<div class='container mt-5'>");
//
//		for (MovieDetail movieDetail : movieDetails) {
//			htmlResponse.append("<div class='row mb-4'>");
//
//			htmlResponse.append("<div class='col-md-4 text-center'>").append("<img src='")
//					.append(request.getContextPath()).append("/resources/imgs/")
//					.append(movieDetail.getMovie().getMoviename().replaceAll(" ", "").toLowerCase())
//					.append(".jpg' alt='").append(movieDetail.getMovie().getMoviename())
//					.append("' class='img-fluid img-thumbnail' width='200' height='300'></div>");
//
//			htmlResponse.append("<div class='col-md-8'>").append("<h4>").append(movieDetail.getMovie().getMoviename())
//					.append("</h4>").append("<p><strong>Language:</strong> ")
//					.append(movieDetail.getMovie().getMovielang()).append("</p>").append("<p><strong>Year:</strong> ")
//					.append(movieDetail.getMovie().getMovieyear()).append("</p>").append("<p><strong>Genre:</strong> ")
//					.append(movieDetail.getGenre().getGname()).append("</p>").append("<p><strong>Actor:</strong> ")
//					.append(movieDetail.getActor().getAname()).append("</p>").append("<a href='clickMovie?id=")
//					.append(movieDetail.getMovie().getMovieid()).append("'")
//					.append(" class='btn btn-danger mt-2'>Watch Movie</a>").append("</div>");
//
//			htmlResponse.append("</div>");
//		}
//
//		htmlResponse.append("</div>");
//
//		return ResponseEntity.ok(htmlResponse.toString());
//	}
	
	
	
	@RequestMapping("/clickMoviee")
	@ResponseBody
	public ResponseEntity<String> searchMovies(@RequestParam("name") String movieName, HttpServletRequest request) {
	    List<MovieDetail> movieDetails = mService.searchMoviesByName(movieName);

	    if (movieDetails.isEmpty()) {
	        return ResponseEntity.ok("<p>No movies found for \"" + movieName + "\"</p>");
	    }

	    StringBuilder htmlResponse = new StringBuilder();
	    
	    // Start movie list div with flexbox styling for horizontal scrolling
	    htmlResponse.append("<div id='movieList' class='d-flex flex-nowrap overflow-auto' ")
	                .append("style='overflow-y: hidden; -ms-overflow-style: none; scrollbar-width: none;'>");

	    // Loop through movie details and build each movie card
	    for (MovieDetail movieDetail : movieDetails) {
	        String movieImgPath = request.getContextPath() + "/resources/imgs/" 
	                              + movieDetail.getMovie().getMoviename().replaceAll(" ", "").toLowerCase() + ".jpg";
	        
	        htmlResponse.append("<div class='col-6 col-md-3 mb-3 flex-shrink-0' style='border-radius: 20px;'>")
	                    .append("<div class='card h-60' style='border-radius: 20px; width: 90%; ")
	                    .append("box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);'>")
	                    // Movie image
	                    .append("<a href='uvalid'").append(movieDetail.getMovie().getMovieid()).append("'>")
	                    .append("<img src='").append(movieImgPath)
	                    .append("' class='card-img-top' alt='").append(movieDetail.getMovie().getMoviename())
	                    .append("' style='border-radius: 20px; height: 400px; object-fit: cover; padding: 10px;'>")
	                    .append("</a>")
	                    // Movie title and watch button
	                    .append("<div class='card-body text-center'>")
	                    .append("<h5 class='card-title'>").append(movieDetail.getMovie().getMoviename()).append("</h5>")
	                    .append("<a href='uvalid'")
	                    .append("' class='btn btn-danger mt-2' style='border-radius: 10px;'>Watch Movie</a>")
	                    .append("</div></div></div>");
	    }

	    htmlResponse.append("</div>");  // Close movie list div

	    return ResponseEntity.ok(htmlResponse.toString());
	}



//		    ================userdashboard================

	@GetMapping("/deleteuser")
	public String deleteUser(@RequestParam("uid") int uid, Model model) {
		uregService.isDeleteuser(uid);
		List<userLoginModel> users = uregService.getAllUser();
		model.addAttribute("users", users);
		List<MovieDetail> movie = uregService.getTopRatedMovies();
		model.addAttribute("movies", movie);

		return "superadminDashboard";
	}

	// userdetailss====================

	@RequestMapping("/viewProfile")
	public String viewProfile(@RequestParam("username") String username, Model model) {
		List<userLoginModel> user = uregService.getUserName(username);

		model.addAttribute("user", user);
		System.out.println(user != null);

		return "viewProfile";

	}

	@PostMapping("/updateUser")
	public String updateUser(userLoginModel user, Model model) {
		// Call service to update user details
		uregService.updateUser(user);

		// Reload the profile after update
		List<userLoginModel> updatedUser = uregService.getUserName(user.getUsername());
		model.addAttribute("user", updatedUser);

		// Add success message
		model.addAttribute("m", "User profile updated successfully!");

		// Return to the profile page with updated information
		return "viewProfile"; // JSP page to display the updated profile
	}

	// Show update form
	@GetMapping("/editProfile")
	public String editProfile(@RequestParam("username") String username, Model model) {
		List<userLoginModel> user = uregService.getUserName(username);

		if (!user.isEmpty()) {
			model.addAttribute("user", user.get(0)); // Display the first user's info for editing
			return "editProfile"; // JSP page with the form to edit user profile
		} else {
			model.addAttribute("errorMessage", "User not found");
			return "errorPage"; // Redirect to an error page if the user is not found
		}
	}

}
