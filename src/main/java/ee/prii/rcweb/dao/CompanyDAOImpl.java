package ee.prii.rcweb.dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import ee.prii.rcweb.model.Company;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

/**
 * An implementation of the CompanyDAO interface.
 *
 */

public class CompanyDAOImpl implements CompanyDAO {
	
	private JdbcTemplate jdbcTemplate;
	
	public CompanyDAOImpl(DataSource dataSource){
		
		jdbcTemplate = new JdbcTemplate(dataSource);
		
	}
	
	@Override
	public void insertOrUpdate(Company company) {
		if (company.getId() > 0) {
			// update
			String sql = "UPDATE company SET name=?, address=?, type_id=? WHERE company_id=?";
			jdbcTemplate.update(sql, company.getName(), 
					company.getAddress(), company.getType_id(), company.getId());
		} else {
			// insert
			String sql = "INSERT INTO company (name, address, type_id)"
						+ " VALUES (?, ?, ?)";
			jdbcTemplate.update(sql, company.getName(), 
					company.getAddress(), company.getType_id());
		}
		
	}
	
	@Override
	public void delete(int companyId) {
		String sql = "DELETE FROM company WHERE company_id=?";
		jdbcTemplate.update(sql, companyId);
	}
	
	@Override
	public List<Company> list(int typeId) {
		String sql = "SELECT c.*, "
				+ " AVG(r.vote) AS average, "
				+ " COUNT(r.rating_id) AS totalcount "
				+ " FROM company as c "
				+ " LEFT JOIN rating AS r ON r.company_id = c.company_id"
				+ " WHERE c.type_id = " + typeId
				+ " GROUP BY c.company_id " ;
		List<Company> listCompany = jdbcTemplate.query(sql, new RowMapper<Company>() {

			@Override
			public Company mapRow(ResultSet rs, int rowNum) throws SQLException {
				Company aCompany = new Company();
	
				aCompany.setId(rs.getInt("company_id"));
				aCompany.setName(rs.getString("name"));
				aCompany.setAddress(rs.getString("address"));
				aCompany.setAverageRating(rs.getInt("average"));
				aCompany.setTotalCount(rs.getInt("totalcount"));
				
				return aCompany;
			}
			
		});
		
		return listCompany;
	}
	
	@Override
	public Company get(int companyId) {
		String sql = "SELECT * FROM company WHERE company_id=" + companyId;
		return jdbcTemplate.query(sql, new ResultSetExtractor<Company>() {

			@Override
			public Company extractData(ResultSet rs) throws SQLException,
					DataAccessException {
				if (rs.next()) {
					Company company = new Company();
					company.setId(rs.getInt("company_id"));
					company.setName(rs.getString("name"));
					company.setAddress(rs.getString("address"));
					company.setType_id(rs.getInt("type_id"));
					return company;
				}
				
				return null;
			}
			
		});
	}
	
	
}
