package com.demo.handler;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.bean.EmployeeBean;
import com.demo.dao.EmployeeDao;
import com.demo.validator.EmployeeFormValidator;

public class EmployeeController extends HttpServlet {    
    private static String INSERT = "/employee.jsp";
    private static String INSERT_Error = "/employee.jsp?errorMsg=Please fill all the fields!!";
    private static String INSERT_Success = "/employee.jsp?okMsg=Succesfully Registered!!";
    private static String Edit = "/edit.jsp";
    private static String EMPRECORD = "/listEmployee.jsp";
    private static String EMPRECORD_Id = "/listEmployee.jsp?userId=0";
    
    private EmployeeDao dao;

    public EmployeeController() {
        super();
        dao = new EmployeeDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("iside*********");
    	String redirect="";
        String uId = request.getParameter("userid");        
        String action = request.getParameter("action");
        if(action.equalsIgnoreCase("insert"))
        {
        	//int id = Integer.parseInt(uId);
        	EmployeeBean employee = new EmployeeBean();
        	//employee.setEmployeeId(id);
            employee.setName(request.getParameter("name"));
      
            employee.setEmail(request.getParameter("email"));
            employee.setAddress(request.getParameter("address"));
            employee.setPhoneNo(request.getParameter("phone"));
            EmployeeFormValidator validator= new  EmployeeFormValidator();
            if(validator.validate(employee))
            {
            dao.addEmployee(employee);
            request.setAttribute("users", dao.getAllEmployees());
            redirect=INSERT_Success;
           	System.out.println("Record Added Successfully");
            }else
            {
            	redirect=INSERT_Error;
            }
        }
        else if (action.equalsIgnoreCase("delete")){
            String userId = request.getParameter("userId");
            int uid = Integer.parseInt(userId);
            dao.removeEmployee(uid);
            redirect = EMPRECORD;
            request.setAttribute("users", dao.getAllEmployees());
            System.out.println("Record Deleted Successfully");
        }else if (action.equalsIgnoreCase("editform")){        	
        	redirect = Edit;            
        } else if (action.equalsIgnoreCase("edit")){
        	String userId = request.getParameter("userid");
            int uid = Integer.parseInt(userId);            
            EmployeeBean user = new EmployeeBean();
        	user.setEmployeeId(uid);
            user.setName(request.getParameter("name"));
            user.setEmail(request.getParameter("email"));
            user.setAddress(request.getParameter("address"));
            user.setPhoneNo(request.getParameter("phone"));
            dao.editEmployee(user);
            request.setAttribute("user", user);
            redirect = EMPRECORD;
            System.out.println("Record updated Successfully");
         } else if (action.equalsIgnoreCase("listUser")){
        	String mode =request.getParameter("mode");
        	//request.setAttribute("users", dao.getAllEmployees());
        	if(null!=mode && !mode.isEmpty()){
        		redirect=EMPRECORD+"?mode=initial";
        	}else{
        		redirect=EMPRECORD;
        	}

         }else if (action.equalsIgnoreCase("getDetail")){
            
            String empId=request.getParameter("userId");
       	  if(null==empId || empId.isEmpty()){
       		  empId="0";
       	  }
             int eid= Integer.parseInt(empId);
         	  String redirectValue="/listEmployee.jsp?userId="+empId+"&displaybyId=true&mode=show";
         	 request.setAttribute("displaybyId", "true");           
        	 redirect = redirectValue;
            // request.setAttribute("users", dao.getEmployeeById(eid));
        	
             
          }   else {
            redirect = INSERT;
        }
         
        RequestDispatcher rd = request.getRequestDispatcher(redirect);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}