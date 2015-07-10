package ee.prii.rcweb.dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import ee.prii.rcweb.model.Rating;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

/**
 * An implementation of the RatingDAO interface.
 *
 */

public class RatingDAOImpl implements RatingDAO {
	
	private JdbcTemplate jdbcTemplate;
	
	public RatingDAOImpl(DataSource dataSource){
		
		jdbcTemplate = new JdbcTemplate(dataSource);
		
	}
	
	@Override
	public void insertOrUpdate(Rating rating) {
		if (rating.getId() > 0) {
			// update
			String sql = "UPDATE rating SET name=?, comment=?, company_id=?, vote=?  WHERE rating_id=?";
			jdbcTemplate.update(sql, rating.getName(), 
					rating.getComment(), rating.getCompany_id(), rating.getId(), rating.getVote());
		} else {
			// insert
			String sql = "INSERT INTO rating (name, comment, company_id, vote)"
						+ " VALUES (?, ?, ?, ?)";
			jdbcTemplate.update(sql, rating.getName(), 
					rating.getComment(), rating.getCompany_id(), rating.getVote());
		}
		
	}
	
	@Override
	public void delete(int ratingId) {
		String sql = "DELETE FROM rating WHERE rating_id=?";
		jdbcTemplate.update(sql, ratingId);
	}
	
	@Override
	public List<Rating> list(int typeId) {
		String sql = "SELECT * FROM rating WHERE company_id = " + typeId;
		List<Rating> listRating = jdbcTemplate.query(sql, new RowMapper<Rating>() {

			@Override
			public Rating mapRow(ResultSet rs, int rowNum) throws SQLException {
				Rating aRating = new Rating();
	
				aRating.setId(rs.getInt("rating_id"));
				aRating.setName(rs.getString("name"));
				aRating.setComment(rs.getString("comment"));
				aRating.setVote(rs.getInt("vote"));
				
				return aRating;
			}
			
		});
		
		return listRating;
	}
	
	@Override
	public Rating get(int ratingId) {
		String sql = "SELECT * FROM rating WHERE rating_id=" + ratingId;
		return jdbcTemplate.query(sql, new ResultSetExtractor<Rating>() {

			@Override
			public Rating extractData(ResultSet rs) throws SQLException,
					DataAccessException {
				if (rs.next()) {
					Rating rating = new Rating();
					rating.setId(rs.getInt("rating_id"));
					rating.setName(rs.getString("name"));
					rating.setComment(rs.getString("comment"));
					return rating;
				}
				
				return null;
			}
			
		});
	}
	
	
}
