package com.kh.qna.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.product.model.vo.PageInfo;
import com.kh.product.model.vo.Product;
import com.kh.qna.model.vo.Qna;


public class QnaDao {
	
	private Properties prop = new Properties();

	
	public QnaDao() {
		
		String fileName = QnaDao.class.getResource("/sql/qna/qna-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
			
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
	}


	public ArrayList<Qna> selectUserQna(Connection conn, int pno) {
		
		ArrayList<Qna> list = new ArrayList<>();
		
		String sql = prop.getProperty("selectUserQna");
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, pno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Qna q = new Qna();
				
				q.setQnaNo(rset.getInt("qna_no"));
				q.setQnaTitle(rset.getString("qna_title"));
				q.setMemId(rset.getString("mem_id"));
				q.setQnaDate(rset.getDate("qna_date"));
				
				list.add(q);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
		
	
	}


	public ArrayList<Qna> selectSortQna(Connection conn, int pno, String sort) {
		
		ArrayList<Qna> list = new ArrayList<>();
		
		String sql = prop.getProperty("selectUserQna")+ " ORDER BY "+ sort + " DESC";
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, pno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Qna q = new Qna();
				
				q.setQnaNo(rset.getInt("qna_no"));
				q.setQnaTitle(rset.getString("qna_title"));
				q.setMemId(rset.getString("mem_id"));
				q.setQnaDate(rset.getDate("qna_date"));
				
				list.add(q);
				
				

				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}
	

	public Qna selectDetailQna(Connection conn, int qno) {
		
		
		
		Qna q = new Qna();
		
		ResultSet rset = null;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("selectDetailQna");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, qno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				q.setMemId(rset.getString("mem_id"));
				q.setEmail(rset.getString("email"));
				q.setMobile(rset.getString("mobile"));
				q.setSecret(rset.getString("secret"));
				q.setQnaTitle(rset.getString("qna_title"));
				q.setQnaDetail(rset.getString("qna_detail"));
				q.setNoticeYn(rset.getString("notice_yn"));

			}
			
			
		} catch (SQLException e) {
			
			
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return q;
	}


	public int insertQna(Connection conn, Qna q) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertQna");
		
		try {
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setInt(1, q.getQnaNo());
			pstmt.setInt(2, q.getPno());
			pstmt.setInt(3, Integer.parseInt(q.getMemId()));
			pstmt.setString(4, q.getpName());
			pstmt.setString(5, q.getQnaTitle());
			pstmt.setString(6, q.getQnaDetail());
			pstmt.setString(7, q.getSecret());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally  {
			close(pstmt);
		}
		

		return result;
	}


	
	public ArrayList<Qna> selectAllQna(Connection conn, PageInfo pi) {
		
		ArrayList<Qna> list = new ArrayList<>();
		
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectAllQna");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() +1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			
			rset = pstmt.executeQuery();

			
			
			while(rset.next()) {
				
				Qna q = new Qna();
				
				q.setQnaNo(rset.getInt("qna_no"));
				q.setpName(rset.getString("p_name"));
				q.setQnaTitle(rset.getString("qna_title"));
				q.setMemId(rset.getString("mem_id"));
				q.setQnaDate(rset.getDate("qna_date"));
				
				list.add(q);
			}
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}
	
	

	public int selectListCount(Connection conn) {
	
		int listCount = 0;

		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				
				listCount = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		
		return listCount;
		
		
		
	}
	
	

}
