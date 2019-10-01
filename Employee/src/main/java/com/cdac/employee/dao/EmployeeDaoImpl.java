package com.cdac.employee.dao;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.cdac.employee.bean.Employee;


public class EmployeeDaoImpl implements IEmployeeDao{
	@Autowired
	JdbcTemplate template;    
	public void setTemplate(JdbcTemplate template) {    
		this.template = template;    
	}
	
		@Override
	public int save(Employee e) {
		// TODO Auto-generated method stub
			 String checkboxvalue = ""; for(int i=0;i<e.getTechnology().length; i++) 
			 {
				 if(e.getTechnology().length > 0) { checkboxvalue+=e.getTechnology()[i]+","; }
				 
			 }
		String sql="insert into EmployeeData1(name,dob,job_profile,technology,email,gender) values('"+e.getName()+"','"+e.getDob()+"','"+e.getJob_profile()+"','"+checkboxvalue+"','"+e.getEmail()+"','"+e.getGender()+"')";    
		System.out.println(sql);
		return template.update(sql);
	}
	@Override
	public int update(Employee e) {
		// TODO Auto-generated method stub

		String checkboxvalue = ""; for(int i=0;i<e.getTechnology().length; i++) {
			checkboxvalue+=e.getTechnology()[i]+","; }
		
		String sql="update EmployeeData1 set name='"+e.getName()+"', dob='"+e.getDob()+"',"
				+ "email='"+e.getEmail()+"',job_profile='"+e.getJob_profile()+"'"
						+ ",technology='"+checkboxvalue+"',gender='"+e.getGender()+"'where id="+e.getId()+"";    
		return template.update(sql);
	}

	@Override
	public int delete(int id) {
		String sql="delete from EmployeeData1 where id="+id+"";    
		return template.update(sql);
	}
	
	@Override
	public Employee getEmployeeById(int id) {
		String sql="select * from EmployeeData1 where id=?";    
		return template.queryForObject(sql, new Object[]{id},new BeanPropertyRowMapper<Employee>(Employee.class));
	}
	
	@Override
	public List<Employee> getEmployees() {
		return template.query("select * from EmployeeData1",new RowMapper<Employee>(){    
			public Employee mapRow(ResultSet rs, int row) throws SQLException {    
				Employee e=new Employee();    
				e.setId(rs.getInt(1));    
				e.setName(rs.getString(2));
				e.setDob(rs.getString(3));
				e.setEmail(rs.getString(4));
				e.setJob_profile(rs.getString(5));
				String technology = rs.getString(6);
				String[] value = technology.split(",");
				e.setTechnology(value);
				e.setGender(rs.getString(7));
				
			
		return e;
	}
		});
	}

	@Override
	public String uploadFile() {
		// TODO Auto-generated method stub
		return null;
	}
	public List<Employee> getFile()
	{
		return null;
	}
	/*
	 * public int upload(FileUpload fl,MultipartFile photo) throws IOException {
	 * 
	 * byte[] photoBytes = photo.getBytes();
	 * 
	 * //String sql = "INSERT INTO images(img_title,img_data) VALUES (?,?)"; String
	 * sql="insert into images(img_title,img_data) values('"+fl.getImg_title()+"','"
	 * +fl.getImg_data()+"')"; return template.update(sql, new Object[] { fl,
	 * photoBytes }); }
	 */
	
	
		
}