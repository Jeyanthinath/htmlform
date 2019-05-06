package controller;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.apache.struts2.dispatcher.SessionMap;

public class Updateaction {
	 String name,email,qualification,dob,address,contactno,pincode,desigantion,password,hideupdate,gender;
		private String userid;
		 private File image;
		 SessionMap<String,Object> sessionMap;
		 HttpSession session;
		 public String delfn;
		 private String imageContentType;
		 private String imageFileName;
	
	
	
	
	public String getGender() {
			return gender;
		}
		public void setGender(String gender) {
			this.gender = gender;
		}
	public String getHideupdate() {
			return hideupdate;
		}
		public void setHideupdate(String hideupdate) {
			this.hideupdate = hideupdate;
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
	public File getImage() {
		return image;
	}
	public void setImage(File image) {
		this.image = image;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getPincode() {
		return pincode;
	}
	public void setPincode(String pincode) {
		this.pincode = pincode;
	}
	public String getContactno() {
		return contactno;
	}
	public void setContactno(String contactno) {
		this.contactno = contactno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getDesigantion() {
		return desigantion;
	}
	public void setDesigantion(String desigantion) {
		this.desigantion = desigantion;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	 public String update()
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
		   
		   }	
	
	
	}
	

