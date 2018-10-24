/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lavin.db;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author samsung
 */
public class DataAccess 
{
    String dbURL = "jdbc:oracle:thin:@localhost:1521:XE";
    String username = "hr";
    String password = "hr";
    public static ArrayList<ArrayList<String>> approve = new ArrayList<ArrayList<String>>();

    Connection conn = null;
    public DataAccess()
    {
        try
        {
            Class.forName("oracle.jdbc.OracleDriver");
            conn = DriverManager.getConnection(dbURL, username, password);
            if(conn!=null) System.out.println("Connection successfully established.");
            else System.out.println("Could not establish connection");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
    public ArrayList<String> getStudentInfo(String studentid)
    {
        ArrayList<String> studentInfo = new ArrayList<String>();
        String stdadviser = new String();String dept_id = new String();
        String selectStatement = "select * from student where student_id = ?";
        
        try
        {    
            PreparedStatement stmt = conn.prepareStatement(selectStatement);
            stmt.setString(1, studentid);
            ResultSet rs = stmt.executeQuery();
            while(rs.next())
            {   
                String stdid = rs.getString("student_id");
                String stdname = rs.getString("student_name");
                String stdaddress = rs.getString("address");
                String stdbatch = rs.getString("batc");
                String stdphone = rs.getString("contact_no");
                stdadviser = rs.getString("adviser_id");
                dept_id = rs.getString(7);
                String stdlvl = rs.getString(8);
                String stdterm = rs.getString(9);
                System.out.println(stdlvl);
                studentInfo.add(stdid);
                studentInfo.add(stdname);
                studentInfo.add(stdaddress);
                studentInfo.add(stdbatch);
                studentInfo.add(stdphone);studentInfo.add(stdlvl);studentInfo.add(stdterm);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        selectStatement = "select teacher_name from teacher where teacher_id = ?";
        
        try
        {    
            PreparedStatement stmt = conn.prepareStatement(selectStatement);
            stmt.setString(1, stdadviser);
            ResultSet rs = stmt.executeQuery();
            if(rs.next())
            {
                String stdadv = rs.getString("teacher_name");
                studentInfo.add(stdadv);
                //return studentInfo;
            }
            else
            {
                String stdadv = null;
                studentInfo.add(stdadv);
            }
            
        }
        catch(Exception e)
        {
            
            e.printStackTrace();
        }
        
        selectStatement = "select dept_name from department where department_id = ?";
        
        try
        {    
            PreparedStatement stmt = conn.prepareStatement(selectStatement);
            stmt.setString(1, dept_id);
            ResultSet rs = stmt.executeQuery();
            while(rs.next())
            {
                String stddept = rs.getString("dept_name");
                
                studentInfo.add(stddept);
                return studentInfo;
            }
            String stddept = null;
            studentInfo.add(stddept);
        }
        catch(Exception e)
        {
            
            e.printStackTrace();
        }
        
        return studentInfo;
    }
    
    public ArrayList<String> getTeacherInfo(String teacherid)
    {
        ArrayList<String> teacherInfo = new ArrayList<String>();
        String dept_id = new String();
        String selectStatement = "select * from teacher where teacher_id = ?";
        
        try
        {    
            PreparedStatement stmt = conn.prepareStatement(selectStatement);
            stmt.setString(1, teacherid);
            ResultSet rs = stmt.executeQuery();
            while(rs.next())
            {   
                String teachid = rs.getString("teacher_id");
                String teachname = rs.getString("teacher_name");
                String teachaddress = rs.getString("address");
                String teachphone = rs.getString("contact_no");
                dept_id = rs.getString("depart");
                teacherInfo.add(teachid);
                teacherInfo.add(teachname);
                teacherInfo.add(teachaddress);
                teacherInfo.add(teachphone);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        
        selectStatement = "select dept_name from department where department_id = ?";
        
        try
        {    
            PreparedStatement stmt = conn.prepareStatement(selectStatement);
            stmt.setString(1, dept_id);
            ResultSet rs = stmt.executeQuery();
            while(rs.next())
            {
                String teachdept = rs.getString("dept_name");
                teacherInfo.add(teachdept);
                return teacherInfo;
            }
            String teachdept = null;
            teacherInfo.add(teachdept);
        }
        catch(Exception e)
        {
            
            e.printStackTrace();
        }
        
        return teacherInfo;
    }
    
    public ArrayList<String> getDeptCourses(String depart,String lvl,String term)
    {
        ArrayList<String> courses = new ArrayList<String>();
        String s = new String();String dept_id = new String();
        String selectStatement = "select department_id from department where dept_name = ?";
        try
        {    
            PreparedStatement stmt = conn.prepareStatement(selectStatement);
            stmt.setString(1, depart);
            ResultSet rs = stmt.executeQuery();
            while(rs.next())
            {   
                dept_id = rs.getString("department_id");
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        selectStatement = "select courses.course_id,lvl,term from dept_offering,courses where dept_offering.course_id = courses.course_id and department_id = ? and lvl = ? and term = ?" ;
        try
        {    
            PreparedStatement stmt = conn.prepareStatement(selectStatement);
            stmt.setString(1, dept_id);stmt.setString(2, lvl);stmt.setString(3, term);
            ResultSet rs = stmt.executeQuery();
            while(rs.next())
            {   
                s = rs.getString("course_id");
                courses.add(s);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return courses;
    }
    
    public ArrayList<String> getTeacherCourses(String id)
    {
        ArrayList<String> courses = new ArrayList<String>();
        String s = new String();
        String selectStatement = "select course_id from teaching where teacher_id = ?";
        try
        {    
            PreparedStatement stmt = conn.prepareStatement(selectStatement);
            stmt.setString(1, id);
            ResultSet rs = stmt.executeQuery();
            while(rs.next())
            {   
                s = rs.getString("course_id");
                courses.add(s);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return courses;
    }
    
    public void getCoursesMarks(String courseid,String studentid,ArrayList<String> students,ArrayList<String> marks,ArrayList<String> grades)
    {
        String id = new String();String grade = new String();String mark = new String();
        if(studentid.length()!=0)
        {
        String selectStatement = "select student_id,mark,grade from result where course_id = ? and student_id = ?";
        try
        {    
            PreparedStatement stmt = conn.prepareStatement(selectStatement);
            stmt.setString(1, courseid); stmt.setString(2, studentid);
            ResultSet rs = stmt.executeQuery();
            while(rs.next())
            {   
                id = rs.getString("student_id"); grade = rs.getString("grade");mark = rs.getString("mark");
                students.add(id);grades.add(grade);marks.add(mark);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        }
        else
        {
        String selectStatement = "select student_id,mark,grade from result where course_id = ?";
        try
        {    
            PreparedStatement stmt = conn.prepareStatement(selectStatement);
            stmt.setString(1, courseid);
            ResultSet rs = stmt.executeQuery();
            while(rs.next())
            {   
                id = rs.getString("student_id"); grade = rs.getString("grade");mark = rs.getString("mark");
                students.add(id);grades.add(grade);marks.add(mark);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }   
        }
        
    }
    
    
    public void getStudentResult(String id, String lvl, String term, ArrayList<String> courses, ArrayList<String> grades)
    {
        String s1 = new String();String s2 = new String();
        String selectStatement = "select course_id,grade from result where student_id = ? and lvl = ? and term = ?";
        
        try
        {    
            PreparedStatement stmt = conn.prepareStatement(selectStatement);
            stmt.setString(1, id);
            stmt.setString(2, lvl);
            stmt.setString(3, term);
            ResultSet rs = stmt.executeQuery();
            while(rs.next())
            {   
                s1 = rs.getString("course_id");
                s2 = rs.getString("grade");
                courses.add(s1);
                grades.add(s2);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
    }
    
    public int createAccount(String id, String type, 
            String password, String depart,String name,String address,String phone)
    {   
        String dept_id = new String();
        try
        {
            String insertCommand = "insert into usr values(?,?,?)";
            PreparedStatement stmt = conn.prepareStatement(insertCommand);
            stmt.setString(1, id);
            stmt.setString(2, type);
            stmt.setString(3, password);
            int count = stmt.executeUpdate();
            if(count!=1)
                return count;
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return 0;
        } 
        try
        {
            
            String insertCommand = "update student set depart = ?,student_name = ?,address = ?,contact_no = ? where student_id = ?";
            PreparedStatement stmt = conn.prepareStatement(insertCommand);
            stmt.setString(5, id);
            stmt.setString(1, depart);
            stmt.setString(2, name);
            stmt.setString(3, address);
            stmt.setString(4, phone);
            int count = stmt.executeUpdate();
            return count;
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return 0;
        } 
    }
    
    public int courseAdd(String id, String lvl, String term, ArrayList<String> strings)
    {   
        String s;
        int count = 0;
        for(int i=0;i<strings.size();i++)
        {
            s = strings.get(i);
            if(s.length()!=0)
            {
            try
            {
                
                String insertCommand = "insert into result values(?,?,?,?,?,?)";
                PreparedStatement stmt = conn.prepareStatement(insertCommand);
                stmt.setString(1, id);
                stmt.setString(2, lvl);
                stmt.setString(3, term);
                stmt.setString(4, s);
                stmt.setString(5, "");
                stmt.setString(6, "");
                count = stmt.executeUpdate();
                if(count==0)
                    return count;
            }
            catch(Exception e)
            {
                e.printStackTrace();
                return 0;
            } 
            }
        }
        return count;
    }
    
    public int updateStudent(String id, String password , String name, String address, String phone)
    {   
        int count=0;
        if(name.length()!=0)
        {
            count++;
            try
            {
                System.out.println("WTF?");
                String updateCommand = "update student set student_name = ? where student_id = ?";
                PreparedStatement stmt = conn.prepareStatement(updateCommand);
                stmt.setString(1, name);
                stmt.setString(2, id);
                count = stmt.executeUpdate();
                //return count;
            }
            catch(Exception e)
            {
                e.printStackTrace();
                return -1;
            } 
        }
        if(address.length()!=0)
        {
            count++;
            try
            {
                String updateCommand = "update student set address = ? where student_id = ?";
                PreparedStatement stmt = conn.prepareStatement(updateCommand);
                stmt.setString(1, address);
                stmt.setString(2, id);
                count = stmt.executeUpdate();
                //return count;
            }
            catch(Exception e)
            {
                e.printStackTrace();
                return -1;
            } 
        }
        if(phone.length()!=0)
        {
            count++;
            try
            {
                String updateCommand = "update student set contact_no = ? where student_id = ?";
                PreparedStatement stmt = conn.prepareStatement(updateCommand);
                stmt.setString(1, phone);
                stmt.setString(2, id);
                count = stmt.executeUpdate();
                //return count;
            }
            catch(Exception e)
            {
                e.printStackTrace();
                return -1;
            } 
        }
        if(password.length()!=0)
        {
            count++;
            try
            {
                String updateCommand = "update usr set user_password = ? where user_id = ?";
                PreparedStatement stmt = conn.prepareStatement(updateCommand);
                stmt.setString(1, password);
                stmt.setString(2, id);
                count = stmt.executeUpdate();
                //return count;
            }
            catch(Exception e)
            {
                e.printStackTrace();
                return -1;
            } 
        }
        return count;
    }
    
    public int updateTeacher(String id, String password , String name, String address, String phone)
    {   
        int count=0;
        if(name.length()!=0)
        {
            
            try
            {
                String updateCommand = "update teacher set teacher_name = ? where teacher_id = ?";
                PreparedStatement stmt = conn.prepareStatement(updateCommand);
                stmt.setString(1, name);
                stmt.setString(2, id);
                count += stmt.executeUpdate();
                //return count;
            }
            catch(Exception e)
            {
                e.printStackTrace();
                return -1;
            } 
        }
        if(address.length()!=0)
        {
            
            try
            {
                String updateCommand = "update teacher set address = ? where teacher_id = ?";
                PreparedStatement stmt = conn.prepareStatement(updateCommand);
                stmt.setString(1, address);
                stmt.setString(2, id);
                count += stmt.executeUpdate();
                //return count;
            }
            catch(Exception e)
            {
                e.printStackTrace();
                return -1;
            } 
        }
        if(phone.length()!=0)
        {
            
            try
            {
                String updateCommand = "update teacher set contact_no = ? where teacher_id = ?";
                PreparedStatement stmt = conn.prepareStatement(updateCommand);
                stmt.setString(1, phone);
                stmt.setString(2, id);
                count += stmt.executeUpdate();
                //return count;
            }
            catch(Exception e)
            {
                e.printStackTrace();
                return -1;
            } 
        }
        if(password.length()!=0)
        {
            
            try
            {
                String updateCommand = "update usr set user_password = ? where user_id = ?";
                PreparedStatement stmt = conn.prepareStatement(updateCommand);
                stmt.setString(1, password);
                stmt.setString(2, id);
                count += stmt.executeUpdate();
                //return count;
            }
            catch(Exception e)
            {
                e.printStackTrace();
                return -1;
            } 
        }
        return count;
    }
    
    public int updateMarks(String id, String course, String marks)
    {   
        String grade; int m = Integer.parseInt(marks);
        if(m<40) 
            grade="F";
        else if(m<45)
            grade = "D";
        else if(m<50)
            grade = "C";
        else if(m<55)
            grade = "C+";
        else if(m<60)
            grade = "B-";
        else if(m<65)
            grade = "B";
        else if(m<70)
            grade = "B+";
        else if(m<75)
            grade = "A-";
        else if(m<80)
            grade = "A";
        else
            grade = "A+";
        int count=0;
        String updateCommand = "update result set mark = ?,grade = ? where student_id = ? and course_id = ?";
        try
        {
            
            PreparedStatement stmt = conn.prepareStatement(updateCommand);
            stmt.setString(1, marks);
            stmt.setString(2, grade);
            stmt.setString(3, id);
            stmt.setString(4, course);
            count += stmt.executeUpdate();
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return 0;
        } 
        
        return count;
    }
    
   
    public String existUser(String userid,String password)
    {
        String type = new String();
        try
        {
            String query = "select * from usr where user_id = ? and user_password = ?";
            
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, userid);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            if(rs.next())
            {
                type = rs.getString("user_type");
                
                return type;
            }
            return type;
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return type;
        }
               
        
    }
    
/*
//Call function sample:
    
    String sql = "{ ? = call FUNCT_PERSON(?,?) }";
    CallableStatement statement = connection.prepareCall(sql);
    statement.setString(2,username);
    statement.setString(3,password);
    statement.registerOutParameter(1, java.sql.Types.INTEGER);  

    statement.execute();   
    //this is the main line
    long id = statement.getLong(1);
    if (id > 0) {
        //proceed to another page
    } else {
        //Go back to the login page
    }*/
    
 /*
    String sql = "{ call PROC_PERSON(?,?,?) }";
    CallableStatement statement = connection.prepareCall(sql);
    statement.setString(2,username);
    statement.setString(3,password);
    statement.registerOutParameter(1, java.sql.Types.INTEGER);  

    statement.execute();   
    //this is the main line
    long id = statement.getLong(1);
    if (id > 0) {
        //proceed to another page
    } else {
        //Go back to the login page
    }*/ 
}
