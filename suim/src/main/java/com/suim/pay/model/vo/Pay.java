package com.suim.pay.model.vo;

import java.sql.Date;

import com.suim.house.model.vo.House;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Pay {
    private int payNo;
    private String tid;
    private double price;
    private Date payDate;
    private String payStatus;
    private int houseNo;
}
