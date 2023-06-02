package com.suim.chat.model.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ChatList {
    private int chatNo;
    private String cuser;
    private String muser;
    private Timestamp cDate;
    private char sCuser;
    private char sMuser;
}
