package com.cdac.employee.controllers;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cdac.employee.bean.Employee;
import com.cdac.employee.service.IEmployeeService;
import com.cdac.employee.validator.EmployeeValidator;

@Controller
public class EmployeeController {
	// private static String UPLOAD_DIRECTORY = "/home/sonali/images";

	@Autowired
	private MessageSource messageSource;

	@Autowired
	private EmployeeValidator empValidator;

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.addValidators(empValidator);
	}

	@Autowired
	private IEmployeeService employeeService;

	@Autowired
	public void setEmployeeService(IEmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	@RequestMapping("employeeForm")
	public String showForm(Model m) {
		m.addAttribute("employee", new Employee());
		return "employeeForm";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("employee") @Validated Employee employee, BindingResult result) {

		if (result.hasErrors()) {
			return "employeeForm";
		} else {
			employeeService.save(employee);
			return "redirect:/viewEmpDataTable";
		}

	}

	@RequestMapping("/viewemp")
	public String viewEmp(Model m) {
		List<Employee> list = employeeService.getEmployees();
		m.addAttribute("list", list);
		return "viewemp";
	}

	@RequestMapping("/viewEmpDataTable")

	public String viewDataTable(Model model, Locale locale)
			throws JsonGenerationException, JsonMappingException, IOException {
		List<Employee> list = employeeService.getEmployees();

		ObjectMapper mapper = new ObjectMapper();
		model.addAttribute("emplist", mapper.writeValueAsString(employeeService.getEmployees()));
		return "viewEmpDataTable";
	}

	@RequestMapping(value = "/deletemp/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable int id) {
		employeeService.delete(id);
		return "redirect:/viewemp";
	}

	@RequestMapping(value = "/empedit/{id}")
	public String edit(@PathVariable int id, Model m) {
		Employee e = employeeService.getEmployeeById(id);
		m.addAttribute("command", e);
		return "empedit";

	}

	@RequestMapping(value = "/editsave", method = RequestMethod.POST)
	public String editsave(@ModelAttribute("employee") Employee employee) {
		employeeService.update(employee);
		return "redirect:/viewemp";
	}

	/* File Uploading */
	private static final String UPLOAD_DIRECTORY = "/home/pallavi/Downloads/Employee/src/main/webapp/images";

	@RequestMapping("uploadform")
	public ModelAndView uploadForm() {
		return new ModelAndView("uploadform");
	}

	@RequestMapping(value = "savefile", method = RequestMethod.POST)
	public ModelAndView saveimage(@RequestParam CommonsMultipartFile file, HttpSession session) throws Exception {

		String path = UPLOAD_DIRECTORY;
		String filename = file.getOriginalFilename();

		System.out.println(path + " " + filename);
		System.out.println(filename);
		byte[] bytes = file.getBytes();
		BufferedOutputStream stream = new BufferedOutputStream(
				new FileOutputStream(new File(path + File.separator + filename)));
		stream.write(bytes);
		stream.flush();
		stream.close();

		return new ModelAndView("uploadform", "filesuccess", "File successfully saved!");
	}

	
	 /* Display File*/


	@RequestMapping(value = "/displayFile")
	public String viewFiles(Model model, HttpServletRequest request) {
		File uploadLocationDir = new File("/home/pallavi/Downloads/Employee/src/main/webapp/images/");
		String[] files = uploadLocationDir.list();
		System.out.println("files " + Arrays.toString(files));
		model.addAttribute("fileList", files);
		return "displayFile";
	}
	
	/*Downloading file*/
String folderPath="/home/demo/Documents/docs/";
	
	@RequestMapping("/")
	public String showFiles(Model model) {
		File folder = new File(folderPath);
		File[] listOfFiles = folder.listFiles();
		model.addAttribute("files", listOfFiles);
		return "showFiles";
	}
	@RequestMapping("/file/{fileName}")
	@ResponseBody
	public void show(@PathVariable("fileName") String fileName, HttpServletResponse response) {

	      if (fileName.indexOf(".doc")>-1) response.setContentType("application/msword");
	      if (fileName.indexOf(".docx")>-1) response.setContentType("application/msword");
	      if (fileName.indexOf(".xls")>-1) response.setContentType("application/vnd.ms-excel");
	      if (fileName.indexOf(".csv")>-1) response.setContentType("application/vnd.ms-excel");
	      if (fileName.indexOf(".ppt")>-1) response.setContentType("application/ppt");
	      if (fileName.indexOf(".pdf")>-1) response.setContentType("application/pdf");
	      if (fileName.indexOf(".zip")>-1) response.setContentType("application/zip");
	      response.setHeader("Content-Disposition", "attachment; filename=" +fileName);
	      response.setHeader("Content-Transfer-Encoding", "binary");
	      try {
	    	  BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
	    	  FileInputStream fis = new FileInputStream(folderPath+fileName);
	    	  int len;
	    	  byte[] buf = new byte[1024];
	    	  while((len = fis.read(buf)) > 0) {
	    		  bos.write(buf,0,len);
	    	  }
	    	  bos.close();
	    	  response.flushBuffer();
	      }
	      catch(IOException e) {
	    	  e.printStackTrace();
	    	  
	      }
	}



}
