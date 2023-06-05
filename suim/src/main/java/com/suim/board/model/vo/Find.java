package com.suim.board.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@NoArgsConstructor
@Setter
@Getter
@ToString
public class Find {
	
//	FIND_NO	NUMBER
//	FIND_TITLE	VARCHAR2(300 BYTE)
//	FIND_COTENT	CLOB
//	FIND_CATEGORY	VARCHAR2(30 BYTE)
//	FIND_VIEW	NUMBER
//	FIND_DATE	DATE
//	STATUS	CHAR(1 BYTE)
//	MEMBER_ID	VARCHAR2(15 BYTE)
	
	private int findNo;
	private String findTitle;
	private String findContent;
	private String findCategory;
	private int findView;
	private Date findDate;
	private String status;
	private String replyCount;
	private String memberId;

}
