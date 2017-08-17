package sendevi;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class UploadSeat
 */
@WebServlet("/report")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class report extends HttpServlet {
     
    //connect to database
  
    private String connURL ="jdbc:mysql://localhost/sip?user=root&password=kumarpillai"; 
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // obtain value from the form
      	String vname = request.getParameter("vname");
    	String vphone = request.getParameter("vphone");
    	String pname = request.getParameter("pname");
    	String gname = request.getParameter("gname");
    	String gphone = request.getParameter("gphone");

    	String desc = request.getParameter("desc");          


        InputStream picturestream = null; // this is the inputstream of the file
         
        // obtains the uploaded file
        Part picturefile = request.getPart("photo");
        if (picturefile != null) {
            // prints out file information
            System.out.println(picturefile.getName());
            System.out.println(picturefile.getSize());
            System.out.println(picturefile.getContentType());
             
            // obtains input stream of the picture
            picturestream = picturefile.getInputStream();
        }
         
        Connection conn = null; // connect to the database
        String message = null;  //send notification to user
         
        try {
            // connect to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(connURL);
 
            
            String sql = "insert into reports (vname,vphone,pname,gname,gphone,desc,photo) values (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, vname);
            statement.setString(2, vphone);
            statement.setString(3, pname);
            statement.setString(4, gname);
            statement.setString(5, gphone);
            statement.setString(6, desc);
            if (picturestream != null) {
                // fetches input stream of the upload file for the blob column
            	// Input the inputstream into the blob
                statement.setBlob(7, picturestream);
            }
 
            // sends notification to client
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "Record Inserted and file uploaded and saved into database";
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                // close  database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
           
            request.setAttribute("Message", message);
             
            // forward to the message page
            getServletContext().getRequestDispatcher("/Message.jsp").forward(request, response);
        }
    }
}