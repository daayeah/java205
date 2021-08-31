package dept.dao;

import static org.junit.Assert.*;

import java.sql.Connection;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import dept.domain.Dept;
import jdbc.util.ConnectionProvider;

public class DeptDaoTest {
	static DeptDao dao;
	static Connection conn;
	private Dept dept;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		conn = ConnectionProvider.getConnection();
		dao = DeptDao.getInstance();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testGetDeptList() {
		assertNotNull("getDeptList() 메소드 테스트", dao.getDeptList(conn));
	}

	@Test
	public void testInsertDept() {
		dept = new Dept(50, "TEST", "SEOUL");
		assertSame("insertDept() 메소드 테스트", 1, dao.insertDept(conn, dept));
	}

	@Test
	public void testDeleteDept() {
		assertSame("deleteDept() 메소드 테스트", 1, dao.deleteDept(conn, 50));
	}

	@Test
	public void testSelectByDeptno() {
		assertNotNull("selectByDeptno() 메소드 테스트", dao.selectByDeptno(conn, 40));
	}

	@Test
	public void testUpdateDept() {
		dept = new Dept(40, "TEST", "BOSTON");
		assertSame("updateDept() 메소드 테스트", 1, dao.updateDept(conn, dept));
	}
}
