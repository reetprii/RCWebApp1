package ee.prii.rcweb.dao;

import java.util.List;

import ee.prii.rcweb.model.Company;

/**
 * Defines DAO operations for the company model.
 *
 */

public interface CompanyDAO {
	
	public void insertOrUpdate(Company company);
	
	public void delete(int companyId);
	
	public Company get(int companyId);
	
	public List<Company> list(int typeId);
}