package model;


import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.commons.io.FileUtils;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

















import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import controller.Controlleraction;
import controller.Updateaction;
public class Modeldao implements ServletRequestAware,ServletResponseAware
	{
	 String name,email,qualification,dob,address,contactno,pincode,desigantion,password,gender;
	SessionMap<String,Object> sessionMap;
	 HttpSession session;
	 public String delfn;
	 int page=1;
	int recordsperpage=2;
	String sql;
	private String search1;
	String hideactive1;
	String hidpdfid;
	
	
	public String getHidpdfid() {
		return hidpdfid;
	}
	public void setHidpdfid(String hidpdfid) {
		this.hidpdfid = hidpdfid;
	}

	String hidsort;
	String hidupdate,hideupdate;
	String hidview;
	HttpServletRequest request;
		HttpServletResponse response;
		public static String userid;
		public static String uname;
		String oldpswd,newpswd,confpswd,hidpswd;
		
		
		
		
		public String getOldpswd() {
			return oldpswd;
		}
		public void setOldpswd(String oldpswd) {
			this.oldpswd = oldpswd;
		}
		public String getNewpswd() {
			return newpswd;
		}
		public void setNewpswd(String newpswd) {
			this.newpswd = newpswd;
		}
		public String getConfpswd() {
			return confpswd;
		}
		public void setConfpswd(String confpswd) {
			this.confpswd = confpswd;
		}
		public String getHidpswd() {
			return hidpswd;
		}
		public void setHidpswd(String hidpswd) {
			this.hidpswd = hidpswd;
		}
		public static String getUserid() {
			return userid;
		}
		public static void setUserid(String userid) {
			Modeldao.userid = userid;
		}
		public static String getUname() {
			return uname;
		}
		public void setUname(String uname) {
			Modeldao.uname = uname;
		}
		
		
		
		
		
		

		public String getHidupdate() {
			return hidupdate;
		}
		public void setHidupdate(String hidupdate) {
			this.hidupdate = hidupdate;
		}
		
		
		 public String getHideupdate() {
			return hideupdate;
		}
		public void setHideupdate(String hideupdate) {
			this.hideupdate = hideupdate;
		}
		public int getRecordsperpage()
		 {
		    return recordsperpage;
		 }

		 public void setRecordsperpage(int recordsperpage)
		 {
		    this.recordsperpage = recordsperpage;
		 }
		
		
		
		
		
		public String getSearch1() {
			return search1;
		}
		public void setSearch1(String search1) {
			this.search1 = search1;
		}
		 public String getHideactive1()
		   {
			 System.out.println(hideactive1);
		      return hideactive1;
		   }

		   public void setHideactive1(String hideactive1)
		   {
		      this.hideactive1 = hideactive1;
		   }
		   public String getGender() {
				return gender;
			}
			public void setGender(String gender) {
				this.gender = gender;
			}
			
			public String getHidsort() {
				return hidsort;
			}
			public void setHidsort(String hidsort)
			{
				this.hidsort = hidsort;
			}
			public String getHidview() {
				return hidview;
			}
			public void setHidview(String hidview)
			{
				
				this.hidview = hidview;
			}
	
	ArrayList<User> list=new ArrayList<User>();
	/*private Rectangle PageSize;
	private Object document;
	private Session PdfWriter;*/
	public ArrayList<User> getList()
	{
		return list;
	}
	public void setList(ArrayList<User> list)
	{
		this.list=list;
	}

	
	public static int Save(Controlleraction c) 
	{
		int status=0;
		int delFlag=0; 
		Date dnow=new Date();
		SimpleDateFormat Ft=new SimpleDateFormat("YYYYMMddhhmmss");
		String createdate=Ft.format(dnow);
		System.out.println(createdate);
		String email=c.getEmail(),password=c.getPassword();
		String name=c.getName();
		
		try
		{
			
				int sno=count()+1;
				String label="SSPL";
				String userid=String.format(label+"%05d",sno);
				String filepath=ServletActionContext.getServletContext().getRealPath("/").concat("image");
				String imagename=userid+".jpg";
				File imagefile=new File(filepath,imagename);
				System.out.println(imagename);
				FileUtils.copyFile(c.getImage(), imagefile);
				
				
				
	Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/strutsdp","root","");
			if(!con.isClosed()) {
				System.out.println("Connected");
			} else {
				System.out.println("Not Connected");
			}
PreparedStatement Ps=con.prepareStatement("Insert Into register(userName,password,email,gender,pincode,address,contactNo,dob,qualification,designation,createdDateTime,createdBy,delFlag,userid,image) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
Ps.setString(1,c.getName());
Ps.setString(2,c.getMD5());
Ps.setString(3,c.getEmail());
Ps.setString(4,c.getGender());
Ps.setString(5,c.getPincode());
Ps.setString(6,c.getAddress());
Ps.setString(7,c.getContactno());
Ps.setString(8,c.getDob());
Ps.setString(9,c.getQualification());
Ps.setString(10,c.getDesigantion());
Ps.setString(11,createdate);
Ps.setString(12,c.getName());
Ps.setInt(13, delFlag);
Ps.setString(14,userid);
Ps.setString(15,imagename);



status=Ps.executeUpdate();
if(status>0) {
	System.out.println("Success: Inserted");
	Mail(email,userid,password,name);
	System.out.println("Successfully SEND to Mail");
} else {
	System.out.println("Not Insert");
}
		} catch(Exception e) {
			System.out.println(e);
		}
		return status;
	}
	public static void Mail(String email2, String userid2, String password2,String name2) 
	
	{	
		String to = email2;
		String message1="welcome:"+name2+"userid:"+userid2+"password:"+password2+"";
			 final String username = "raja2k82@gmail.com";
		        final String password = "earthjesus32";

		        Properties props = new Properties();
		        props.put("mail.smtp.starttls.enable", "true");
		        props.put("mail.smtp.auth", "true");
		        props.put("mail.smtp.host", "smtp.gmail.com");
		        props.put("mail.smtp.port", "587");

		        Session session = Session.getInstance(props,
		          new javax.mail.Authenticator()
		        {
		            protected PasswordAuthentication getPasswordAuthentication()
		            {
		                return new PasswordAuthentication(username, password);
		            }
		          });

		        try {

		            Message message = new MimeMessage(session);
		            message.setFrom(new InternetAddress(username));
		            message.setRecipients(Message.RecipientType.TO,
		                InternetAddress.parse(to));
		            message.setSubject("Testing Subject");
		            message.setText(message1);

		            Transport.send(message);
		            
		            
		

		            System.out.println("Done");

		        } catch (MessagingException e)
		        {
		            throw new RuntimeException(e);
		        }
		} 
			
		
		
		
	
	private static int count() {
			int count=0;
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/strutsdp","root","");
				PreparedStatement ps=con.prepareStatement("SELECT count(*) As count FROM register");
				ResultSet rs=ps.executeQuery();
				while (rs.next())
				{
					count =rs.getInt("count");
				}
			}
				catch (Exception e)
				{
					System.out.println(e);
					
				}
				return count;
	}
	public static boolean logvalidate(String name,String password)
	{
		boolean status=false;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/strutsdp","root","");
			PreparedStatement ps=con.prepareStatement("SELECT * FROM register WHERE userName='"+name+"' AND password='"+password+"'");
			System.out.println(ps);		
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				userid=rs.getString("userid");
				status=true;
			}
			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return status;
	}
	
	public String changepswd()
	{
		String status="error",dbpswd=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/strutsdp","root","");
			PreparedStatement ps1=con.prepareStatement("SELECT password FROM register WHERE userid='"+this.hidpswd+"'");
			System.out.println(ps1);		
			ResultSet rs=ps1.executeQuery();
			while(rs.next())
			{
				dbpswd=rs.getString("password");
			}
			if (dbpswd.equals(this.oldpswd)) 
			{
				if (this.newpswd.equals(this.confpswd))
				{
				PreparedStatement ps2=con.prepareStatement("update register SET password='"+this.newpswd+"' WHERE userid='"+this.hidpswd+"'");
			ps2.executeUpdate();
				status="success";
				
				}
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return status;
	
		
			
			}
	
	
	public String view()
	{
		
		String status="error";
		System.out.println(this.getSearch1());
		try
		{
			System.out.println(hideactive1);
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/strutsdp","root","");
		if(request.getParameter("page")!=null)
		{
			page=Integer.parseInt(request.getParameter("page"));	
		}
		int p=(page-1)*recordsperpage;
		if(this.getSearch1()!=null && this.getSearch1().length()>0)
		{
			
		 this.sql = "SELECT * FROM register where userName LIKE  '%"+this.getSearch1()+"%'" ;
		}
		else if (this.hideactive1!=null && this.hideactive1.length()>0)
			
		{
			this.sql="SELECT * FROM register WHERE delflag='"+this.hideactive1+"'";
		}
		
else if (this.gender!=null && this.gender.length()>0)
			
		{
			this.sql="SELECT * FROM register WHERE gender='"+this.gender+"'";
		}
else if (this.getHidsort()!=null && this.getHidsort().length()>0)
	
{
	this.sql="SELECT * FROM register ORDER BY ".concat(this.hidsort).concat(" ASC");
}		
		else {
			this. sql= "SELECT * FROM register WHERE delflag=0 LIMIT "+p+","+recordsperpage+""; 
			System.out.println(sql);
		}
		
		
		String qry = this.sql;
		PreparedStatement ps=con.prepareStatement(qry);
		ResultSet rs=ps.executeQuery();
		while (rs.next())
		   {
			   User u=new User();
			   u.setId(rs.getInt("id"));
			   u.setName(rs.getString("username"));
			   u.setUserid(rs.getString("userid"));
			   u.setEmail(rs.getString("email"));
			   u.setGender(rs.getString("gender"));
			   u.setAddress(rs.getString("address"));
			   u.setPincode(rs.getString("pincode"));
			   u.setImage(rs.getString("image"));
			   list.add(u);
			   status="success";
			   
			   
		   }
		
		int noofrecords=count();
		int noofpage=(int)Math.ceil(noofrecords*1.0/recordsperpage);
		request.setAttribute("emplist",list);
		request.setAttribute("pages",noofpage);
		request.setAttribute("currentpage",page);
		RequestDispatcher view=request.getRequestDispatcher("view.jsp");
		view.forward(request,response);
		con.close();
		return status;
		
	}
		catch(Exception e)
		{
			System.out.println(e);
		}
	return status;
		
	}
	
	
	
	public String viewfunction()//single view
	{
		try
		{
			
			System.out.println(hidview);
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/strutsdp","root","");	
			this.sql = "SELECT * FROM register where id='"+this.hidview+"'";
			System.out.println(sql);
			PreparedStatement ps=con.prepareStatement(this.sql);
			ResultSet rs=ps.executeQuery();
			while (rs.next())
			   {
				uname=rs.getString("userid");
				   User u=new User();
				   u.userid=rs.getString("userid");
				   u.setName(rs.getString("username"));
				   u.setUserid(rs.getString("userid"));
				   u.setEmail(rs.getString("email"));
				   u.setGender(rs.getString("gender"));
				   u.setAddress(rs.getString("address"));
				   u.setPincode(rs.getString("pincode"));
				   u.setImage(rs.getString("image"));
				   list.add(u);
				   	
				   
			   }
			con.close();
			System.out.println("success");
			return "success";
			}
			catch(Exception e) {
				System.out.println(e);{
					e.printStackTrace();
				}
			}
			return "error";
		}
	
	

	public String updateview()
	{
		try
		{
			
			System.out.println(hidupdate);
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/strutsdp","root","");	
			this.sql = "SELECT * FROM register where userid='"+this.hidupdate+"'";
			System.out.println(sql);
			PreparedStatement ps=con.prepareStatement(this.sql);
			ResultSet rs=ps.executeQuery();
			while (rs.next())
			   {
				   User u=new User();
				   u.setName(rs.getString("username"));
				   u.setUserid(rs.getString("userid"));
				   u.setEmail(rs.getString("email"));
				   u.setGender(rs.getString("gender"));
				   u.setAddress(rs.getString("address"));
				   u.setPincode(rs.getString("pincode"));
				   list.add(u);
				   	
				   
			   }
			con.close();
			System.out.println("success");
			return "success";
			}
			catch(Exception e) {
				System.out.println(e);{
					e.printStackTrace();
				}
			}
			return "error";
		}
	
	
	
	
	
	public static int update(Updateaction u) {
		int status=0;
		Date dnow=new Date();
		SimpleDateFormat Ft=new SimpleDateFormat("YYYYMMddhhmmss");
		String updatedate1=Ft.format(dnow);
		System.out.println(updatedate1);
		
		try
		{
			String filepath=ServletActionContext.getServletContext().getRealPath("/").concat("image");
			String imagename=u.getHideupdate()+".jpg";
			File imagefile=new File(filepath,imagename);
			System.out.println(imagename);
			FileUtils.copyFile(u.getImage(), imagefile);
			
				
				
	Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/strutsdp","root","");
			if(!con.isClosed()) {
				System.out.println("Connected");
			} else {
				System.out.println("Not Connected");
			}
PreparedStatement Ps=con.prepareStatement("Update register SET userName=?,email=?,gender=?,pincode=?,address=?,contactNo=?,dob=?,qualification=?,designation=?,updatedBy=?,updatedDateTime=?,image=? WHERE userId='"+u.getHideupdate()+"'");
Ps.setString(1,u.getName());
Ps.setString(2,u.getEmail());
Ps.setString(3,u.getGender());
Ps.setString(4,u.getPincode());
Ps.setString(5,u.getAddress());
Ps.setString(6,u.getContactno());
Ps.setString(7,u.getDob());
Ps.setString(8,u.getQualification());
Ps.setString(9,u.getDesigantion());
Ps.setString(10,u.getName());
Ps.setString(11,updatedate1);
Ps.setString(12,imagename);



status=Ps.executeUpdate();
if(status>0) {
	//status="success";
	System.out.println("Success: Inserted");
} else {
	System.out.println("Not Insert");
}
		} catch(Exception e) {
			System.out.println(e);
		}
		return status;
	}
	@Override
	public void setServletResponse(HttpServletResponse response) {
		// TODO Auto-generated method stub
		this.response=response;
		
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request=request;
		
	}
	
	public static int delete(String delfn) {
		int status=0;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/strutsdp","root","");
			if(!con.isClosed()) {
				System.out.println("Connected");
			} else {
				System.out.println("Not Connected");
			}
	PreparedStatement Ps=con.prepareStatement("Update register SET delflag='1'  WHERE userName='"+delfn+"'");
	status=Ps.executeUpdate();
			} catch(Exception e) {
				System.out.println(e);
			}
		
		return status;
	}
	
	

public void pdf()throws IOException{
		
		ByteArrayOutputStream baos =new ByteArrayOutputStream();
		Document d=new Document(PageSize.A4,20,20,20,20);
		String asset =ServletActionContext.getServletContext().getRealPath("/pdf");
		try
		{
			String pdfFile=this.hidpdfid+".pdf";
			File f=new File(asset+pdfFile);
			response.setContentType("application/pdf");
			PdfWriter writer=PdfWriter.getInstance(d, baos);
			d.open();
			//Font font=new Font(FontFamily.GEORGIA,12,Font.BOLD);
			Paragraph head=new Paragraph("EmployeeDetails");
			head.setAlignment(Element.ALIGN_CENTER);
			PdfPTable table=new PdfPTable(3);
			PdfPCell name=new PdfPCell(new Phrase("username"));
			table.addCell(name);
			PdfPCell email=new PdfPCell(new Phrase("email"));
			table.addCell(email);
			PdfPCell image=new PdfPCell(new Phrase("image"));
			table.addCell(image);

		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/strutsdp","root","");
			PreparedStatement Ps =con.prepareStatement ("SELECT * FROM register");
			System.out.println(Ps);
			ResultSet rs=Ps.executeQuery();
			while (rs.next())
			{
		table.addCell(rs.getString("userName"));
		table.addCell(rs.getString("email"));	
		Image image1 = Image.getInstance(request.getServletContext().getRealPath("/").concat("image").concat("/").concat(rs.getString("image")));     
	       table.addCell(image1); 

			}
		}catch (Exception e) {
			System.out.println(e);
		}
		d.add(head);
		d.add(table);
		d.close();
		writer.close();
		response.addHeader("Content-Disposition","attachment;filename="+pdfFile);
		response.setContentLength(baos.size());
		System.out.println(baos.size());
		FileOutputStream fos = new FileOutputStream(f);
		ServletOutputStream sos=response.getOutputStream();
		baos.writeTo(fos);
		baos.writeTo(sos);
		sos.flush();
		} 
	    catch(DocumentException e) {
		System.out.println(e);
	     }  
	}

public void excel()
{
	ByteArrayOutputStream baos=new ByteArrayOutputStream();
    String savepath=ServletActionContext.getServletContext().getRealPath("/xls/");
	try
	{
		int i=0;
		HSSFWorkbook workbook = new HSSFWorkbook(); 
		HSSFSheet spreadsheet = workbook.createSheet("newsheet");
		HSSFRow row = spreadsheet.createRow(0);
		String xlsfile="customer_view.xls";
		File f=new File(savepath+xlsfile);
		response.setContentType("application/ms-excel");
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/strutsdp","root","");
		
	
			if(!con.isClosed()){
				System.out.println("connected");
			}
			else
			{
				System.out.println("connection failed");	
			}
			java.sql.PreparedStatement PS=con.prepareStatement("Select * From register");
			ResultSet rs=PS.executeQuery();
			 row = spreadsheet.createRow(i);
			 row.createCell(1).setCellValue("userid");
			 row.createCell(2).setCellValue("userName");
			 row.createCell(3).setCellValue("email");
			 row.createCell(4).setCellValue("pincode");
			 row.createCell(5).setCellValue("gender");
			i++;											
			
			while(rs.next())
			{
				int u=rs.getInt("gender");
				
				HSSFRow row1 = spreadsheet.createRow(i);	
				row1.createCell(1).setCellValue(rs.getString("userid"));
				 row1.createCell(2).setCellValue(rs.getString("userName"));
				 row1.createCell(3).setCellValue(rs.getString("email"));
				 row1.createCell(4).setCellValue(rs.getString("pincode"));
				if (u==1){
					row1.createCell(5).setCellValue("male");
				}
				else
				{
					row1.createCell(5).setCellValue("female");
				}
					 
				 
					 
				 
				
				 i++;
									
			}
			
			
		}catch(Exception e)
		{
			System.out.print(e);
		}
		response.addHeader("content-disposition", "attachment;filename="+xlsfile);
		response.setContentLength((int)f.length());
		FileOutputStream fos=new FileOutputStream(f);
		ServletOutputStream sos;
		sos=response.getOutputStream();
		workbook.write(sos);
		workbook.write(fos);
		sos.flush();
		fos.close();
		System.out.println("open to connected");
	}
	catch(Exception e){
		System.out.println(e);
	
	}
	
}

}
		
	