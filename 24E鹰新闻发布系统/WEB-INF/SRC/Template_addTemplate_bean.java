package com.v246;
public class Template_addTemplate_bean
{
	protected ReplaceAll replaceAll=new ReplaceAll();
	protected java.sql.Connection conn=null;
	protected Connections tmpConn=new Connections();
	protected InvertedComma ic=new InvertedComma();
	protected CheckBox checkBox=new CheckBox();
	public Template_addTemplate_bean()throws Exception
	{
		conn=tmpConn.getConnection();
	}
	public void addTemplate(Template_addTemplate_form template,String MN)throws Exception
	{
		String templateType=template.getTemplateType();
		String templateName=ic.getIC(template.getTemplateName());
		String content=Aqu.getGB(template.getContent());
		String isDefault=checkBox.getValue(template.getIsDefault());
	//	content=replaceAll.replaceAll(content,"\"","&#034;");
		content=replaceAll.replaceAll(content,"'","&#039;");
		content=Aqu.addIC(content);
		//System.out.println(content);
		StringBuffer insert=new StringBuffer("insert into Template(WithType,TemplateName,Content,IsDefault) values(");
		insert.append(templateType);
		insert.append(",");
		insert.append(templateName);
		insert.append(",");
		insert.append(content);
		insert.append(",");
		insert.append(isDefault);
		insert.append(")");
		try
		{
			java.sql.Statement stm=conn.createStatement();
			if(MN.equals("modify"))
			{
				stm.executeUpdate("update template set WithType="+templateType+",TemplateName="+templateName+",content="+content+",IsDefault="+isDefault+" where TemplateId="+template.getModifyId());
				
			}
			else
			{
				if(isDefault.equals("1"))
				{
					stm.executeUpdate("update template set IsDefault=0 where WithType="+templateType);
					stm.executeUpdate(insert.toString());
				}
				else
				{
					stm.executeUpdate(insert.toString());
				}
			}
			if(stm!=null) stm.close();
			if(conn!=null) conn.close();
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}