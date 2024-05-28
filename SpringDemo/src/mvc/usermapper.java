package mvc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class usermapper implements RowMapper<user> {

	public user mapRow(ResultSet resultSet, int i) throws SQLException {
		user user = new user();
		user.setUserid(resultSet.getInt("userid"));
		user.setUsername(resultSet.getString("username"));
		user.setUsermail(resultSet.getString("usermail"));
		user.setUserphone(resultSet.getString("userphone"));
		user.setUsertypeid(Integer.parseInt(resultSet.getString("usertypeid")));
		user.setUserpincode(resultSet.getString("userpincode"));

		return user;
	}
}