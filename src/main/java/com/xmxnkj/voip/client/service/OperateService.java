package com.xmxnkj.voip.client.service;

import java.util.List;

import com.hsit.common.service.BusinessBaseService;
import com.xmxnkj.voip.client.entity.ClientUser;
import com.xmxnkj.voip.client.entity.Operate;
import com.xmxnkj.voip.client.entity.query.OperateQuery;

public interface OperateService extends BusinessBaseService<Operate, OperateQuery> {
	public void deleteOperate(String id);
	
	public List<Operate> queryUserOperate(String clientId, String clientUserId);
	
	public List<Operate> queryUserOperate(ClientUser clientUser);
	
	public Boolean userHasOperate(ClientUser clientUser, String code);
}
