package com.suim.report.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suim.common.model.vo.PageInfo;
import com.suim.report.model.dao.AdminReportDao;
import com.suim.report.model.vo.Report;

@Service
public class AdminReportServiceImpl implements AdminReportService {

	@Autowired
	private AdminReportDao adminReportDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount() {
		return adminReportDao.selectListCount(sqlSession);
	}

	// 전체 조회용
	@Override
	public ArrayList<Report> selectList(PageInfo pi) {
		return adminReportDao.selectList(sqlSession, pi);
	}
	
	// 카테고리용 전체 조회
	@Override
	public ArrayList<Report> selectList(PageInfo pi, String category) {
		return adminReportDao.selectList(sqlSession, pi, category);
	}

	@Override
	public int insertReport(Report r) {
		return adminReportDao.insertReport(sqlSession, r);
	}

	@Override
	public Report selectReport(int reportNo) {
		return adminReportDao.selectReport(sqlSession, reportNo);
	}

	@Override
	public int deleteReport(int reportNo) {
		return adminReportDao.deleteReport(sqlSession, reportNo);
	}

	@Override
	public int updateReport(Report r) {
		return adminReportDao.updateReport(sqlSession, r);
	}
	
	// 승인/반려 처리용
	@Override
	public int updateReportStatus(Report r) {
		return adminReportDao.updateReportStatus(sqlSession, r);
	}

}
