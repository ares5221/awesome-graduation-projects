package zhanlang.DAO;

import java.util.List;

import zhanlang.entity.Book;
import zhanlang.entity.Person;

public interface ManagerDAO {
	
	/**
	 * 
	 * @param command
	 * @param person
	 * @return	
	 * 
	 * 管理员的登录功能
	 * 由登录页面调用，传来操作指令与登录对象。
	 */
	public boolean login(String command,Person person);
	
	/**
	 * 
	 * @retrun
	 * 添加用户功能
	 * 由管理员页面调用，传来操作指令     与     要添加的用户的对象
	 */
	public Object addUser(String command,Person person);
	
	/**
	 * 
	 * @return
	 * 删除用户功能
	 * 有管理员页面调用，传来操作指令    与   要删除的用户对象
	 * 
	 */
	public Object deleteUser(String command,Person person);
	
	/**
	 * 
	 * @return
	 * 修改用户密码
	 * 有管理员页面调用，传来操作指令    与   要修改的用户对象的密码
	 * 
	 */
	public Object alterPassword(String command,Person person);

	/**
	 * 
	 * @return
	 * 修改用户密码
	 * 有管理员页面调用，传来操作指令    与   要修改的用户对象的密码
	 * 
	 */
	public Object addBook(String command,Book book);


	/**
	 * 
	 * @return
	 * 修改用户密码
	 * 有管理员页面调用，传来操作指令    与   要修改的用户对象的密码
	 * 
	 */
	public Object deleteBook(String command,Book book);

	/**
	 * 
	 * @return
	 * 修改用户密码
	 * 有管理员页面调用，传来操作指令    与   要修改的用户对象的密码
	 * 
	 */
	public Object showAlready(String command,Book book);
	
	/**
	 * 查看所有借书信息
	 * 由管理员页面调用，传来操作指令	与	要修改的用户对象的密码
	 * @return
	 */
	public List<List<Book>> borrowInfo(String command,Book book);

}
