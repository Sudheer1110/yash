package mvc;

import java.util.List;

public interface DAObridge {
	public List<user> getEmployeeByNo(int i, int typeId);

	public void insertUser(String name, String email, String phone, int typeId, String userpincode);

	public boolean updateEmployee(user e);

	public List<HouseDetails> getHouseByUserNo(int userId);

	public List<HouseDetails> getHouseByPincode(String pincode);

	public boolean deleteEmployee(int houseId);

	public void insertHouse(int userId, String houseName, int houseType, int rooms, String doornumber, double latitude,
			double longitude, boolean availability_status, String pincode);
}
