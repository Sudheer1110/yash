package mvc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class Housemapper implements RowMapper<HouseDetails> {
	private String nameofapartment, doornumber;
	int typeofhouse, noofrooms, owner_id;
	boolean availability_status;
	int id;
	double latitude, longitude;

	@Override
	public HouseDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
		HouseDetails hd = new HouseDetails();
		hd.setId(rs.getInt("id"));
		hd.setNameofapartment(rs.getString("nameofapartment"));
		hd.setDoornumber(rs.getString("doornumber"));
		hd.setTypeofhouse(rs.getInt("typeofhouse"));
		hd.setNoofrooms(rs.getInt("noofrooms"));
		hd.setOwner_id(rs.getInt("owner_id"));
		hd.setLatitude(rs.getDouble("latitude"));
		hd.setLongitude(rs.getDouble("longitude"));

		return hd;
	}

}
