package controller;
import java.io.File;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Map;





import java.util.Random;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class Controlleraction extends ActionSupport implements SessionAware 

{

	private static final long serialVersionUID = 1L;
String name,email,gender,qualification,dob,address,contactno,pincode,desigantion,recordsperpage;
public String userid,hideupdate;
 public File image;
 public String search;
 SessionMap<String,Object> sessionMap;
 HttpSession session;
 public String delfn;
 private String imageContentType;
 private String imageFileName;
 
 
 char[] pass=randompassword(6);
 String password=new String(pass);
 String MD5=cryptwithMD5(password);
 
 
 
 
 
 
 

private String cryptwithMD5(String password2) {
		
				try { 

					MessageDigest md = MessageDigest.getInstance("MD5"); 

					
					byte[] messageDigest = md.digest(password2.getBytes()); 

					 
					BigInteger no = new BigInteger(1, messageDigest); 

					String hashtext = no.toString(16); 
					while (hashtext.length() < 32) { 
						hashtext = "0" + hashtext; 
					} 
					return hashtext; 
				} 

				
				catch (NoSuchAlgorithmException e) { 
					throw new RuntimeException(e); 
				} 
			} 

			
			

	  
	    
	    private char[] randompassword(int len) {
	    	 System.out.println("Generating password using random() : "); 
		        System.out.print("Your new password is : "); 
		  
		      
		        String Capital_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"; 
		        String Small_chars = "abcdefghijklmnopqrstuvwxyz"; 
		        String numbers = "0123456789"; 
		                String symbols = "!@#$%^&*_=+-/.?<>)"; 
		  
		  
		        String values = Capital_chars + Small_chars + 
		                        numbers + symbols; 
		  
		       
		        Random rndm_method = new Random(); 
		  
		        char[] password = new char[len]; 
		  
		        for (int i = 0; i < len; i++) 
		        { 
		            
		            password[i] = 
		              values.charAt(rndm_method.nextInt(values.length())); 
		  
		        } 
		        return password; 
		 } 
		



public String getDelfn() 
{
return delfn;
}
public void setDelfn(String delfn)
{
	this.delfn = delfn;
}

	public String getHideupdate() {
	return hideupdate;
}

public void setHideupdate(String hideupdate) {
	this.hideupdate = hideupdate;
}

	public String getName()
	   {
	      return name;
	   }

	   public void setName(String name)
	   {
	      this.name = name;
	   }
	  
	   
	   public String getEmail()
	   {
	      return email;
	   }

	   public void setEmail(String email)
	   {
	      this.email = email;
	   }
	  
		   public String getGender()
		   {
			      return gender;
			   }

			   public void setGender(String gender)
			   {
			      this.gender = gender;
			   }

			   
			   public String getQualification()
			   {
				      return qualification;
				   }

				   public void setQualification(String qualification)
				   {
				      this.qualification = qualification;
				   }
				   public String getPassword()
				   {
					      return password;
					   }

					   public void setPassword(String password)
					   {
					      this.password = password;
					   }
				   public String getDob()
				   {
					      return dob;
					   }

					   public void setDob(String dob)
					   {
					      this.dob = dob;
					   }
					   public String getAddress()
					   {
						      return address;
						   }

						   public void setAddress(String address)
						   {
						      this.address = address;
						   }
						   public String getContactno() 
						   {
							      return contactno;
							   }

							   public void setContactno(String contactno)
							   {
							      this.contactno = contactno;
							   }
				   public String getPincode()
				   {
					      return pincode;
					   }

					   public void setPincode(String pincode)
					   {
					      this.pincode = pincode;
					   }
					   
					   public String getDesigantion()
					   {
						      return desigantion;
						   }

						   public void setDesigantion(String desigantion)
						   {
						      this.desigantion = desigantion;
						   }
						   
						   
						   
						   public String getUserid()
						   {
							      return userid;
							   }

							   public void setUserid(String userid)
							   {
							      this.userid = userid;
							   }
					   public File getImage()
					   {
						      return image;
						   }

						   public void setImage(File image)
						   {
							   
						      this.image = image;
						   }
						   
						 
						   public String register()
						   {
							   int i=model.Modeldao.Save(this);
							   if(i>0)
							   {
								   return "success";
							   }
							   else
							   {
								   return "error";
							   }
							   
							   }

						  /* public String update()
						   {
							   int i=model.Modeldao.update(this);
							   if(i>0)
							   {
								   return "success";
							   }
							   else
							   {
								   return "error";
							   }
							   
							   }			*/			   
						   /*public String delete()
						   {
							   int i=model.Modeldao.delete(delfn);
							   if(i>0)
							   {
								   return "success";
							   }
							   else
							   {
								   return "error";
							   }
							   
							   }			
						   */
						   
public String log()
{
	System.out.println("sdjbf");
	if(model.Modeldao.logvalidate(this.name,this.password))
	{
		System.out.println("sdf");
		session=ServletActionContext.getRequest().getSession(true);
		session.setAttribute("name",name);
		return "success";
	}
	else
	{
		return "error";
	}
}

public void setSession(Map<String, Object> map)
{
	sessionMap=(SessionMap<String, Object>) map;
}

public String getImageContentType() {
	return imageContentType;
}

public void setImageContentType(String imageContentType) {
	this.imageContentType = imageContentType;
}

public String getImageFileName() {
	return imageFileName;
}

public void setImageFileName(String imageFileName) {
	this.imageFileName = imageFileName;
}






public String getMD5() {
	return MD5;
}






public void setMD5(String mD5) {
	MD5 = mD5;
}





}
