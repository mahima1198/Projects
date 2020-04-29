<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        Application["NoOfVisitors"] = 0;   
    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        
    }

    void Session_End(object sender, EventArgs e) 
    {
        Application.Lock();
        Application["NoOfVisitors"] = Convert.ToInt32(Application["NoOfVisitors"]) + 1;
        Application.UnLock(); 

    }
       
</script>
