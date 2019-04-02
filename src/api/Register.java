package api;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import services.users.UserAuthService;
import services.users.UserService;
import bean.users.AuthBean;
import bean.users.CompUserBean;
import bean.users.RolesBean;
import bean.users.UserBean;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Path("/register")
public class Register {

	private UserService userService = new UserService();
	private UserAuthService authService = new UserAuthService();
	GsonBuilder gsonBuilder = new GsonBuilder();
	Gson gson = gsonBuilder.create();

	@Path("/users")
	@POST
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public Response registerUser(@FormParam("firstName") String firstName,
			@FormParam("lastName") String lastName,
			@FormParam("email") String email,
			@FormParam("password") String password,
			@FormParam("confirmPassword") String confirmPassword)
			throws ServletException, IOException {

		String status = "0";
		String error = checkValidation(firstName, lastName, email, password,
				confirmPassword);

		if (error != null) {
			String result = error;
			return Response.status(100).entity(result).build();
		}
		int rec = checkUserExisit(email);
		if (rec < 0) {
			return Response.status(302).entity("Email Already Exsist").build();
		} else {

			try {

				UserBean ub = new UserBean();
				ub.setFirstName(firstName);
				ub.setLastName(lastName);
				RolesBean rb = new RolesBean();
				ub.setRoles(userService.getRoleById(3));
				ub.setStatus("2");
				int id = userService.insert(ub);

				AuthBean ab = new AuthBean();
				ab.setEmail(email);
				ab.setPassword(password);
				ab.setUser(ub);
				authService.insert(ab);

			} catch (ClassNotFoundException | SQLException e) {
				return Response.status(302).entity(e).build();
			}

			return Response.status(200).entity("Register Successfully").build();
		}

	}

	protected String checkValidation(String firstName, String lastName,
			String email, String password, String confirmPassword) {

		String error = null;

		if (firstName.equals("")) {
			error = "Please Enter First Name";
		}

		else if (lastName.equals("")) {
			error = "Please Enter Last Name";
		}

		else if (email.equals("")) {
			error = "Please Enter Email";
		}

		else if (password.equals("")) {
			error = "Please Enter Password";
		}

		else if (confirmPassword.equals("")) {
			error = "Please Enter Confirm Password";
		}

		else if ((firstName.equals("")) || (lastName.equals(""))
				|| (email.equals("")) || (password.equals(""))
				|| (confirmPassword.equals(""))) {
			error = "Please Fill Fields";
		}

		else if (!confirmPassword.equals(password)) {
			error = "Password Didn't Match";
		} else {
			error = null;

		}
		return error;
	}

	private int checkUserExisit(String email) {

		AuthBean bean = null;
		try {
			bean = userService.getByEmail(email);
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("Email No Found ---- ");
		}
		// System.out.println("Nulll  - - - "+bean);
		if (bean != null)
			return -1;
		else
			return 1;

	}

	@POST
	@Path("/login")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public CompUserBean getAuth(AuthBean bean) {

		AuthBean auth = null;
		UserBean ub = null;
		RolesBean rb = null;
		try {
			System.out.println(bean.getEmail());
			System.out.println(bean.getPassword());
			auth = userService.getByEmailAndPass(bean.getEmail(), bean.getPassword());
			System.out.println(auth);
			
			if (auth != null) {
				ub = auth.getUser();
				rb = ub.getRoles();
			}
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("Email No Found ---- ");
		}

		if (auth != null) {
			return new CompUserBean(ub, auth, rb);
		}

		return null;

	}

	@GET
	public Response getResponse() {

		String result = "<h1>RESTful Demo Application</h1>In real world application, a collection of users will be returned !!";
		return Response.status(200).entity(result).build();
	}

}
