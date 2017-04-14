public class CreateUserController {

    public CreateUserController() {

    }

    public String firstName {get; set;}
    public String lastName {get; set;}
    public String company {get; set;}
    public String communityNickname {get; set;}
    public String email {get; set;}
    public String alias{get; set;}
    string Roleselected;
    string Profileselected;
    
    Public String getRoleselected(){
        return Roleselected;
    }
    public void setRoleselected(String Roleselected) {
            this.Roleselected = Roleselected;
        }
        
 Public String getProfileselected(){
        return Profileselected;
    }
    public void setProfileselected(String Profileselected) {
            this.Profileselected= Profileselected;
        }        

    
    Public user use {get;set;}
  
    Public List<selectoption> getRoles(){ 
    List<userRole> rolesList= [select Name from userRole];
    system.debug('RolesList'+rolesList);    
    List<SelectOption> options = new List<SelectOption>();
    
    for(UserRole usr: rolesList){
        options.add(new SelectOption(usr.Name,usr.Name));
    }
    return options;
    }
  
    public CreateUserController (apexpages.standardcontroller setcon){
    this.use = (User)setcon.getRecord();    
    //Public List<se>
    }
    
    
     Public user ude {get;set;}
     Public List<selectoption> getProfiles(){ 
    List<Profile> ProfilesList= [select Name from Profile];
    system.debug('ProfilesList'+ProfilesList);    
    List<SelectOption> optionspro = new List<SelectOption>();
    
    for(Profile ude: ProfilesList){
        optionspro.add(new SelectOption(ude.Name,ude.Name));
    }
    return optionspro;
    }     
    
    public PageReference registerUser() {
    String userName = email;

        User u = new User();
        u.Username = userName;
        u.Email = email;
        u.FirstName = firstName;
        u.LastName = lastName;
        u.CommunityNickname = communityNickname;
        u.CompanyName = company;
        u.alias=alias;
        system.debug('>>>Inserting the user'+u);
        insert u;
        return null;}

}