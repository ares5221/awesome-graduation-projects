package zhanlang.view;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.net.UnknownHostException;

public class Client {
	static LoginMenu loginMenuFrame;
	static ManagerMenu managerMenuFrame;
	static M_AddBook mAddBookFrame;
	static M_AddUser mAddUserFrame;
	static M_DeleteBook mDeleteBookFrame;
	static M_DeleteUser mDeleteUserFrame;
	static M_ModifyUserPwd mModifyUserPwdFrame;
	static M_ShowBorrowMessage ShowBorrowMessage;
	static M_About about;
	
	static UserMenu userMenuFrame;
	static U_RegesterUser uRegesterFrame;
	static U_ModifyMessage uModifyMessageFrame;
	static U_BorrowBook uBorrowbookFrame;
	static U_BorrowBook uBorrowbookFrame2;
	static U_ShowMessage showMessageFrame;
	static U_ShowAllBook showAllBookFrame;
	static U_ShowAlready showCanAllFrame;
	
	/**创建字符输出流对象，在静态代码块中初始化它，以便以后其他类的引用*/
	public static OutputStream os ;
	public static InputStream is ;
	
	public static Socket socket;

	public static void main(String[] args) {
		loginMenuFrame=new LoginMenu();
		loginMenuFrame.setVisible(true);
		loginMenuFrame.setLocationRelativeTo(null);
	}
}
