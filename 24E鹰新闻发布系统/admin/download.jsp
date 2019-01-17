
<%@ page import="java.io.*"%>
<%

    String root = getServletContext().getRealPath("/");

    String filename = "/sysimage/rect.gif";
    response.setContentType("unknown");
    response.addHeader("Content-Disposition", "filename=\"" + filename + "\"");

    try
    {
       ServletOutputStream sos = response.getOutputStream();
            BufferedReader br=new BufferedReader(new FileReader(root+filename));

            String line=br.readLine();
            while (line!=null)
            {
                sos.write(line.getBytes());
                sos.println();
                line=br.readLine();
            }
            sos.close();
            br.close();
        }
        catch (Exception e)
        {
            System.out.println(e);
        }

%>

