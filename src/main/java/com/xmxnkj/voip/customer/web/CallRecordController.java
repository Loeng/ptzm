package com.xmxnkj.voip.customer.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xmxnkj.voip.customer.dao.CallRecordDao;
import com.xmxnkj.voip.customer.entity.CallRecord;
import com.xmxnkj.voip.customer.entity.query.CallRecordQuery;
import com.xmxnkj.voip.customer.service.CallRecordService;
import com.xmxnkj.voip.web.BaseController;

/**
 * 
 * @author zjx
 *
 */
@Controller
@RequestMapping("/customer/callRecord")
public class CallRecordController extends BaseController<CallRecord, CallRecordQuery, CallRecord> {
	@Autowired
	private CallRecordService service;
	
	@Autowired
	private CallRecordDao dao;
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public CallRecordService getService() {
		return service;
	}
	@Override
	protected void beforeQuery(CallRecordQuery query) {
		query.setClientUserId(getLoginClientUserId());
		super.beforeQuery(query);
	}
}