package com.demo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.demo.bean.EmployeeBean;
import com.demo.dbconnection.ConnectionProvider;

public class EmployeeDao {

    private Connection conn;

    public EmployeeDao() {
    	conn = ConnectionProvider.getConnection();
    }

    public void addEmployee(EmployeeBean employeeBean) {
        try {
        	String sql = "INSERT INTO employee(ename,email,address,phone)" +
    		" VALUES (?, ? , ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            
            //ps.setInt(1, employeeBean.getEmployeeId());
            ps.setString(1, employeeBean.getName());
            ps.setString(2, employeeBean.getEmail()); 
            ps.setString(3, employeeBean.getAddress());
            ps.setString(4, employeeBean.getPhoneNo());
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void removeEmployee(int empId) {
        try {
        	String sql = "DELETE FROM employee WHERE empid=?";
            PreparedStatement ps = conn
                    .prepareStatement(sql);
            ps.setInt(1, empId);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
      }

    public void editEmployee(EmployeeBean employeebean) {    	
    	try {
    		String sql = "UPDATE employee SET ename=?,email=?,address=?,phone=?" +
            " WHERE empid=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, employeebean.getName());
            ps.setString(2, employeebean.getEmail());            
            ps.setString(3, employeebean.getAddress());
            ps.setString(4, employeebean.getPhoneNo());
            ps.setInt(5, employeebean.getEmployeeId());
            ps.executeUpdate();            

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public List<EmployeeBean>getAllEmployees() {
        List<EmployeeBean>  employees = new ArrayList<EmployeeBean> ();
        try {
        	String sql = "SELECT * FROM employee";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                EmployeeBean  employeebean = new EmployeeBean();
                employeebean.setEmployeeId(rs.getInt("empid"));
                employeebean.setName(rs.getString("ename"));
                employeebean.setEmail(rs.getString("email"));
                employeebean.setAddress(rs.getString("address"));
                employeebean.setPhoneNo(rs.getString("phone"));
                
                
                employees.add(employeebean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return employees;
    }

    public EmployeeBean getEmployeeById(int empId) {
    	EmployeeBean  employeebean = new EmployeeBean();        try {
        	String sql = "SELECT * FROM employee WHERE empid=?";
            PreparedStatement ps = conn.
                    prepareStatement(sql);
            ps.setInt(1, empId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
            	
                employeebean.setEmployeeId(rs.getInt("empid"));
                employeebean.setName(rs.getString("ename"));
                employeebean.setEmail(rs.getString("email"));
                employeebean.setAddress(rs.getString("address"));
                employeebean.setPhoneNo(rs.getString("phone"));
                
                
            
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employeebean;
    }
}