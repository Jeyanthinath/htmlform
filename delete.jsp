package controller;

public class Deleteaction {

	String delfn;
	
	
	
	public String getDelfn() {
		return delfn;
	}



	public void setDelfn(String delfn) {
		this.delfn = delfn;
	}



	public String delete()
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
	   
}
