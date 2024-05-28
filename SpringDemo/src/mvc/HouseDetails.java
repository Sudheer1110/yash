package mvc;

public class HouseDetails {
	public String nameofapartment, doornumber;
	public int typeofhouse, noofrooms, owner_id;
	public boolean availability_status;
	public int id;
	public double latitude, longitude;

	public HouseDetails() {

	}

	public String getNameofapartment() {
		return nameofapartment;
	}

	public void setNameofapartment(String nameofapartment) {
		this.nameofapartment = nameofapartment;
	}

	public String getDoornumber() {
		return doornumber;
	}

	public void setDoornumber(String doornumber) {
		this.doornumber = doornumber;
	}

	public int getTypeofhouse() {
		return typeofhouse;
	}

	public void setTypeofhouse(int typeofhouse) {
		this.typeofhouse = typeofhouse;
	}

	public int getNoofrooms() {
		return noofrooms;
	}

	public void setNoofrooms(int noofrooms) {
		this.noofrooms = noofrooms;
	}

	public int getOwner_id() {
		return owner_id;
	}

	public void setOwner_id(int owner_id) {
		this.owner_id = owner_id;
	}

	public boolean isAvailability_status() {
		return availability_status;
	}

	public void setAvailability_status(boolean availability_status) {
		this.availability_status = availability_status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

}
