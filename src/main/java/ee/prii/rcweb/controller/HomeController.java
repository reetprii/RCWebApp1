package ee.prii.rcweb.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import javax.validation.Valid;

import ee.prii.rcweb.dao.CompanyDAO;
import ee.prii.rcweb.model.Company;
import ee.prii.rcweb.dao.RatingDAO;
import ee.prii.rcweb.model.Rating;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Controller...
 *
 */
@Controller
public class HomeController {

	@Autowired
	private CompanyDAO companyDAO;

	@Autowired
	private RatingDAO ratingDAO;

	@RequestMapping(value = "/")
	public ModelAndView listCompany(ModelAndView model) throws IOException {

		int typeId = 1;

		List<Company> listCompany = companyDAO.list(typeId);
		model.addObject("listCompany", listCompany);
		model.setViewName("home");

		return model;
	}

	@RequestMapping(value = "/type", method = RequestMethod.GET)
	public ModelAndView listCompany(ModelAndView model, HttpServletRequest request) {
		int typeId = Integer.parseInt(request.getParameter("id"));

		List<Company> listCompany = companyDAO.list(typeId);
		model.addObject("listCompany", listCompany);
		model.setViewName("home");

		return model;
	}

	@RequestMapping(value = "/newRating", method = RequestMethod.GET)
	public ModelAndView listRating(ModelAndView model, HttpServletRequest request) {
		int companyId = Integer.parseInt(request.getParameter("id"));

		Company company = companyDAO.get(companyId);
		String companyName = company.getName();
		model.addObject("companyName", companyName);
		
		
		Rating newRating = new Rating();
		newRating.setCompany_id(companyId);
		
		
		model.addObject("rating", newRating);

		List<Rating> listRating = ratingDAO.list(companyId);
		model.addObject("listRating", listRating);

		model.setViewName("RatingForm");

		return model;
	}

	@RequestMapping(value = "/saveRating", method = RequestMethod.POST)
	public ModelAndView saveRating(ModelAndView model, @Valid @ModelAttribute("rating") Rating rating,
			BindingResult result) {
		if (result.hasErrors()) {
			
			Company company = companyDAO.get(rating.getCompany_id());
			String companyName = company.getName();
			model.addObject("companyName", companyName);
			
			model.setViewName("RatingForm");
			return model;
		} else {
			ratingDAO.insertOrUpdate(rating);
		}
		return new ModelAndView("redirect:/");
	}

	@RequestMapping(value = "/newCompany", method = RequestMethod.GET)
	public ModelAndView newCompany(ModelAndView model) {
		Company newCompany = new Company();
		model.addObject("company", newCompany);

		model.setViewName("CompanyForm");
		return model;
	}

	@RequestMapping(value = "/saveCompany", method = RequestMethod.POST)
	public ModelAndView saveCompany(@ModelAttribute Company company) {

		companyDAO.insertOrUpdate(company);
		return new ModelAndView("redirect:/");
	}

	@RequestMapping(value = "/deleteCompany", method = RequestMethod.GET)
	public ModelAndView deleteCompany(HttpServletRequest request) {
		int companyId = Integer.parseInt(request.getParameter("id"));
		companyDAO.delete(companyId);
		return new ModelAndView("redirect:/");
	}

	@RequestMapping(value = "/editCompany", method = RequestMethod.GET)
	public ModelAndView editCompany(HttpServletRequest request) {
		int companyId = Integer.parseInt(request.getParameter("id"));
		Company company = companyDAO.get(companyId);
		ModelAndView model = new ModelAndView("CompanyForm");
		model.addObject("company", company);

		return model;
	}
}
