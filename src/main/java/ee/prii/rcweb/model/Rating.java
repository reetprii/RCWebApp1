package ee.prii.rcweb.model;

import javax.validation.constraints.Size;
import org.hibernate.validator.constraints.Range;


public class Rating {
    private int id;
    
    @Size(min=1, max=100, message = "Palun sisesta nimi!")
    private String name;
    
    @Size(min=2, max=250, message = "Palun sisesta kommentaar!")
    private String comment;
    
    @Range(min=1, message = "Palun määra hinnang ühest kümneni!")
    private int vote;
    
    private int company_id;

 
    public Rating() {
    }
 
    public Rating(String name, String comment, int type_id) {
        this.name = name;
        this.comment = comment;

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
	
	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getVote() {
		return vote;
	}

	public void setVote(int vote) {
		this.vote = vote;
	}
	
	public int getCompany_id() {
		return company_id;
	}

	public void setCompany_id(int company_id) {
		this.company_id = company_id;
	}
	
}