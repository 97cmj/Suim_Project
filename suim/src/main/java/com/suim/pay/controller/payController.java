package com.suim.pay.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.suim.house.model.service.HouseService;
import com.suim.house.model.vo.House;
import com.suim.pay.model.service.PayService;


@Controller
@RequestMapping("pay")
public class payController {
	
	@Autowired
	private HouseService houseService;
	
	@Autowired
	private PayService payService;
	
	@RequestMapping("kakaopay")
	@ResponseBody
	public String kakaopay(int hno) {
		
	    House h = houseService.selectHouse(hno);

	    try {
	        URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
	        HttpURLConnection huc = (HttpURLConnection) url.openConnection();
	        huc.setRequestMethod("POST");
	        huc.setRequestProperty("Authorization", "KakaoAK 13fc955495d1fe2148e4af8b813e14c4");
	        huc.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
	        huc.setDoOutput(true);

	        String itemName = URLEncoder.encode(h.getHouseName(), "UTF-8");
	        int deposit = h.getDeposit();
	        String price = String.valueOf(deposit);
	        
	        String parameter = "cid=TC0ONETIME" +
	                "&partner_order_id=partner_order_id" +
	                "&partner_user_id=partner_user_id" +
	                "&item_name=" + itemName +
	                "&quantity=1" +
	                "&total_amount=" + price +
	                "&vat_amount=0" +
	                "&tax_free_amount=0" +
	                "&approval_url=http://localhost:8006/kakaoPaySuccess" +
	                "&fail_url=http://localhost:8006/kakaoPayCancel" +
	                "&cancel_url=http://localhost:8006/kakaoPaySuccessFail";
	        
	        //"&approval_url=http://localhost:8006/update.pay?houseName=" + encodedHouseName +
	        
	        OutputStream ops = huc.getOutputStream();
	        DataOutputStream dos = new DataOutputStream(ops);
	        dos.writeBytes(parameter);
	        dos.close();

	        int result = huc.getResponseCode();
	        
	        InputStream is;
	     // 승인이 성공적으로 이루어졌을 때의 처리
	        if (result == 200) {
	            is = huc.getInputStream();
	            
	            InputStreamReader isr = new InputStreamReader(is);
		        BufferedReader br = new BufferedReader(isr);
		        String response = br.readLine();
	            Map<String, String> responseMap = parseResponse(response);
	            
	            if (responseMap.containsKey("tid")) {
	                String tid = responseMap.get("tid");
	                System.out.println(tid);
	            }
	            
		        return response;
		        
	        } else {
	            is = huc.getErrorStream();
	        }
	        
	    } catch (MalformedURLException e) {
	        e.printStackTrace();
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    return "{\"result\":\"NO\"}";
	}

	private Map<String, String> parseResponse(String response) {
	    Map<String, String> responseMap = new HashMap<>();

	    JSONParser parser = new JSONParser();
	    try {
	        Object obj = parser.parse(response);
	        if (obj instanceof Map) {
	            Map<String, Object> jsonMap = (Map<String, Object>) obj;
	            String tid = (String) jsonMap.get("tid");
	            responseMap.put("tid", tid);
	        }
	    } catch (ParseException e) {
	        e.printStackTrace();
	    }

	    return responseMap;
	}

}