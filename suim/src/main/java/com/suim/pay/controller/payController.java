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

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.suim.house.model.vo.House;

@Controller
@RequestMapping("/jq")
public class payController {
	
	@RequestMapping("/jq.cls")
	public ModelAndView main(ModelAndView mv, HttpSession s, RedirectView rv) {
		
		mv.setViewName("jq/test");
		return mv;
	}
	@RequestMapping("/pay.cls")
	public ModelAndView serve(ModelAndView mv, HttpSession s, RedirectView rv) {
		
		mv.setViewName("jq/serve");
		return mv;
	}
	
	@RequestMapping("/kakaopay.cls")
	@ResponseBody
	public String kakaopay() {
		
		try {
			URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection huc = (HttpURLConnection) url.openConnection();
			huc.setRequestMethod("POST");
			huc.setRequestProperty("Authorization", "KakaoAK 13fc955495d1fe2148e4af8b813e14c4");
			huc.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=UTF-8");
			huc.setDoOutput(true);
			House selectHouse = new House();
			//selectHouse = "디비에서 조회한 쉐어하우스 정보를 가진 객체";
			String parameter = "cid=TC0ONETIME" + 
					"&partner_order_id=partner_order_id" + 
					"&partner_user_id=partner_user_id" + 
					"&item_name=" + selectHouse.getHouseName() + 
					"&quantity=1" + 
					"&total_amount=2200" + 
					"&vat_amount=200" + 
					"&tax_free_amount=0" + 
					"&approval_url=http://localhost:8006/update.bo" + //성공 시 결제상태 update
					"&fail_url=http://localhost:8006/list.bo" + 
					"&cancel_url=http://localhost:8006/mypage/house";//쉐어하우스 목록
//			String parameter = "cid=TC0ONETIME"
//					+ "&partner_order_id=partner_order_id"
//					+ "&partner_user_id=partner_user_id"
//					+ "&item_name=초코파이"
//					+ "&quantity=1"
//					+ "&total_amount=2200"
//					+ "&vat_amount=200"
//					+ "&tax_free_amount=0"
//					//+ "&approval_url=https://localhost/jq/pay.cls"
//					+ "&approval_url=http://localhost:8006/"
//					+ "&fail_url=https://localhost/fail"
//					+ "&cancel_url=https://localhost/cancel";
			System.out.println(parameter);
			OutputStream ops = huc.getOutputStream();
			DataOutputStream dos = new DataOutputStream(ops);
			dos.writeBytes(parameter);
			dos.close();
			
			int result = huc.getResponseCode();
			
			InputStream is;
			if(result == 200) {
				is = huc.getInputStream();
			} else {
				is = huc.getErrorStream();
			}
			
			InputStreamReader isr = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(isr);
			return br.readLine();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "{\"result\":\"NO\"}";
	}
	
	

}
