package vn.edu.saigontech.SpringMVCDemo.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import vn.edu.saigontech.SpringMVCDemo.daos.specializationDAO;
import vn.edu.saigontech.SpringMVCDemo.daos.studentDAO;
import vn.edu.saigontech.SpringMVCDemo.models.Specialization;
import vn.edu.saigontech.SpringMVCDemo.models.Student;

@Controller
@Transactional
@EnableWebMvc
@RequestMapping("norest")
public class studentController {

	@Autowired
	private studentDAO studentDAO;

	@Autowired
	private specializationDAO specializationDAO;

	@RequestMapping(value = "/Student")
	public ModelAndView getAllStudent() {
		List<Student> stuList = (List<Student>) studentDAO.getAllStudent();
		ModelAndView result = new ModelAndView("StudentList");

		result.addObject("listStudent", stuList);
		return result;
	}

	@RequestMapping(value = "/addStudent")
	public ModelAndView goAdd() {
		ModelAndView result = new ModelAndView("addStudent");

		List<Specialization> listSpec = specializationDAO.getAllSpecialization();

		result.addObject("listSpec", listSpec);

		return result;
	}

	@RequestMapping(value = "/saveStudent")
	public String goSave(HttpServletRequest req) {
		ModelAndView result = new ModelAndView("addStudent");

		String firstName = req.getParameter("addFirstName");
		String lastName = req.getParameter("addLastName");
		String email = req.getParameter("addEmail");
		boolean isMale = req.getParameter("addGender").equals("male") ? true : false;

		Specialization specialization = specializationDAO
				.getSpecializationByID(Integer.parseInt(req.getParameter("addSpecialization")));

		Student newStu = new Student(firstName, lastName, email, isMale, specialization);

		studentDAO.addStudent(newStu);

		return "redirect:/norest/Student?notification=Adding successfully!";
	}

	@RequestMapping(value = "/deleteStudent")
	public String goDelete(HttpServletRequest req) {

		String[] idArr = req.getParameterValues("idDelete");

		for (String id : idArr) {
			int idNum = Integer.parseInt(id);

			studentDAO.deleteStudent(idNum);
		}

		return "redirect:/norest/Student?notification=Removing successfully!";
	}

	@RequestMapping(value = "/updateStudent")
	public ModelAndView goUpdate(@RequestParam("idUpdate") String idUpdate) {

		ModelAndView mv = new ModelAndView("updateStudent");
		mv.addObject("targetStu", studentDAO.getStudentByID(Integer.parseInt(idUpdate)));

		List<Specialization> listSpec = specializationDAO.getAllSpecialization();

		mv.addObject("listSpec", listSpec);

		return mv;
	}

	@RequestMapping(value = "/confirmUpdateStudent")
	public String goConfirm(HttpServletRequest req) {
		int id = Integer.parseInt(req.getParameter("updateID"));
		String firstName = req.getParameter("updateFirstName");
		String lastName = req.getParameter("updateLastName");
		String email = req.getParameter("updateEmail");
		boolean isMale = req.getParameter("updateGender").equals("male") ? true : false;

		Specialization specialization = specializationDAO
				.getSpecializationByID(Integer.parseInt(req.getParameter("updateSpecialization")));

		Student newStu = new Student(id, firstName, lastName, email, isMale, specialization);

		studentDAO.updateStudent(newStu);

		return "redirect:/norest/Student?notification=Updating successfully!";
	}
}