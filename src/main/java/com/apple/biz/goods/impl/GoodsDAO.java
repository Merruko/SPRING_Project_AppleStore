 package com.apple.biz.goods.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.apple.biz.common.JDBCUtil;
import com.apple.biz.goods.GoodsVO;

@Repository("goodsDAO")
public class GoodsDAO {
		//JDBC 관련변수 
		private Connection conn = null;
		private PreparedStatement stmt = null;
		private ResultSet rs = null;
		
		//SQL명령어들
		private final String GOODS_INSERT = "INSERT INTO a_goods(gid, gname, price, category, info) VALUES (?,?,?,?,?)";
		private final String GOODS_UPDATE = "UPDATE a_goods SET gname=?, price=?, category=?, info=? WHERE gid=?";
		private final String GOODS_DELETE = "DELETE a_goods WHERE gid=?";
		private final String GOODS_GET = "SELECT * FROM a_goods WHERE gid=?";
		private final String GOODS_LIST = "SELECT * FROM a_goods ORDER BY gid DESC";

		//상품입력
		public void insertGoods(GoodsVO vo) {
			try {
				conn = JDBCUtil.getConnection();
				stmt = conn.prepareStatement(GOODS_INSERT);
				stmt.setString(1, vo.getgId());
				stmt.setString(2, vo.getgName());
				stmt.setInt(3, vo.getPrice());
				stmt.setString(4, vo.getCategory());
				stmt.setString(5, vo.getInfo());
				stmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(stmt, conn);
			}
		}
		
		//상품수정
		public void updateGoods(GoodsVO vo) {
			try {
				conn = JDBCUtil.getConnection();
				stmt = conn.prepareStatement(GOODS_UPDATE);
				stmt.setString(1, vo.getgName());
				stmt.setInt(2, vo.getPrice());
				stmt.setString(3, vo.getCategory());
				stmt.setString(4, vo.getInfo());
				stmt.setString(5, vo.getgId());
				stmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(stmt, conn);
			}
		}
		
		//상품삭제
		public void deleteGoods(GoodsVO vo) {
			try {
				conn = JDBCUtil.getConnection();
				stmt = conn.prepareStatement(GOODS_DELETE);
				stmt.setString(1, vo.getgId());
				stmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(stmt, conn);
			}
		}
	
		//상품조회
		public GoodsVO getGoods(GoodsVO vo) {
			GoodsVO goods = null;
			try {
				conn = JDBCUtil.getConnection();
				stmt = conn.prepareStatement(GOODS_GET);
				stmt.setString(1, vo.getgId());
				rs = stmt.executeQuery();
				while(rs.next()) {
					goods = new GoodsVO();
					goods.setgId(rs.getString("GID"));
					goods.setgName(rs.getString("GNAME"));
					goods.setPrice(rs.getInt("PRICE"));
					goods.setCategory(rs.getString("CATEGORY"));
					goods.setInfo(rs.getString("INFO"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(rs, stmt, conn);
			} 	
			return goods;
		}
		
		//상품 목록 조회
		public List<GoodsVO> getGoodsList(GoodsVO vo) {
			List<GoodsVO> goodsList = new ArrayList<GoodsVO>();
			try {
				conn = JDBCUtil.getConnection();
				stmt = conn.prepareStatement(GOODS_LIST);
				rs = stmt.executeQuery();
				while(rs.next()){
					GoodsVO goods = new GoodsVO();
					goods.setgId(rs.getString("GID"));
					goods.setgName(rs.getString("GNAME"));
					goods.setPrice(rs.getInt("PRICE"));
					goods.setCategory(rs.getString("CATEGORY"));
					goods.setInfo(rs.getString("INFO"));
					goodsList.add(goods);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(rs, stmt, conn);
			} 	
			return goodsList;
		}
}