package ee.prii.rcweb.model;

public class Company {
    private int id;
    private String name;
    private String address;
    private int averageRating;
    private int totalCount;
    private int type_id;

 
    public Company() {
    }
 
    public Company(String name, String address, int type_id, int averageRating, int totalCount) {
        this.name = name;
        this.address = address;
        this.averageRating = averageRating;
        this.totalCount = totalCount;
        this.type_id = type_id;

	}
    
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getAverageRating() {
		return averageRating;
	}

	public void setAverageRating(int averageRating) {
		this.averageRating = averageRating;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
	public int getType_id() {
		return type_id;
	}

	public void setType_id(int type_id) {
		this.type_id = type_id;
	}
	
}