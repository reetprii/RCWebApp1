package ee.prii.rcweb.dao;

import java.util.List;

import ee.prii.rcweb.model.Rating;

/**
 * Defines DAO operations for the rating model.
 *
 */

public interface RatingDAO {
	
	public void insertOrUpdate(Rating rating);
	
	public void delete(int ratingId);
	
	public Rating get(int ratingId);
	
	public List<Rating> list(int companyId);
}