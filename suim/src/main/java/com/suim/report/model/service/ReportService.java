package com.suim.report.model.service;

import com.suim.report.model.vo.Rattachment;
import com.suim.report.model.vo.Report;

public interface ReportService {

	int insertReport(Report r);

	// 블랙리스트 누적 횟수 조회용
	int selectBlackList(String reportId);
	// 블랙리스트로 상태 변경용
	int updateBlackList(String reportId);
	
	int insertRattachment(Rattachment ra);
}
