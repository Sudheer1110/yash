package mvc;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao implements DAObridge {
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@SuppressWarnings("deprecation")
	public List<user> getEmployeeByNo(int eno, int typeId) {

		String SQL_FIND_EMPLOYEE = "select * from yasrentusers where userid = ? and usertypeid  = ? ;";
		return jdbcTemplate.query(SQL_FIND_EMPLOYEE, new Object[] { eno, typeId }, new usermapper());

	}

	public void insertUser(String name, String email, String phone, int typeId, String userpincode) {
		String sql = "INSERT INTO yasrentusers (username, usermail ,userphone,usertypeid,userpincode) VALUES (?,?,?,?,?)";
		jdbcTemplate.update(sql, name, email, phone, typeId, userpincode);
	}

	public boolean updateEmployee(user e) {
		String SQL_UPDATE_EMPLOYEE = "update yasrentusers set username = ?, userphone = ?, usermail  = ?, userpincode  = ? where userid = ?";
		return jdbcTemplate.update(SQL_UPDATE_EMPLOYEE, e.getUsername(), e.getUserphone(), e.getUsermail(),
				e.getUserpincode(), e.getUserid()) > 0;
	}

	@Override
	public List<HouseDetails> getHouseByUserNo(int userId) {
		String SQL_FIND_EMPLOYEE = "select * from yasrenthouses where owner_id = ? ";
		return jdbcTemplate.query(SQL_FIND_EMPLOYEE, new Object[] { userId }, new Housemapper());
	}

	public void insertHouse(int userId, String houseName, int houseType, int rooms, String doornumber, double latitude,
			double longitude, boolean availability_status, String pincode) {
		String sql = "INSERT INTO yasrenthouses (nameofapartment, typeofhouse ,noofrooms,latitude,longitude,owner_id,doornumber,availability_status,pincode) VALUES (?,?,?,?,?,?,?,?,?)";
		jdbcTemplate.update(sql, houseName, houseType, rooms, latitude, longitude, userId, doornumber,
				availability_status, pincode);
	}

	public boolean deleteEmployee(int houseId) {
		final String SQL_DELETE_EMPLOYEE = "delete from yasrenthouses where id = ?";
		return jdbcTemplate.update(SQL_DELETE_EMPLOYEE, houseId) > 0;
	}

	@Override
	public List<HouseDetails> getHouseByPincode(String pincode) {
		String SQL_FIND_HOUSES = "SELECT * FROM yasrenthouses WHERE CAST(pincode AS INTEGER) BETWEEN ? AND ?";
		int central = Integer.parseInt(pincode);
		int minPincode = central - 3;
		int maxPincode = central + 3;
		return jdbcTemplate.query(SQL_FIND_HOUSES, new Object[] { minPincode, maxPincode }, new Housemapper());
	}

}
