package com.nmims.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class TestAuditTrailsApiResponseBean implements Serializable{
	
	private List<TestAuditNetworkLogBean> networkLogs;
	private List<PageVisitBean> pageVisits;
	private List<LostFocusLogBean> lostFocusLog;
	private List<TestLogResponseBean> testLogs;
	
	public List<TestAuditNetworkLogBean> getNetworkLogs() {
		return networkLogs;
	}

	public void setNetworkLogs(List<TestAuditNetworkLogBean> networkLogs) {
		this.networkLogs = networkLogs;
	}

	public List<PageVisitBean> getPageVisits() {
		return pageVisits;
	}

	public void setPageVisits(List<PageVisitBean> pageVisits) {
		this.pageVisits = pageVisits;
	}

	public List<LostFocusLogBean> getLostFocusLog() {
		return lostFocusLog;
	}

	public void setLostFocusLog(List<LostFocusLogBean> lostFocusLog) {
		this.lostFocusLog = lostFocusLog;
	}

	public List<TestLogResponseBean> getTestLogs() {
		return testLogs;
	}

	public void setTestLogs(List<TestLogResponseBean> testLogs) {
		this.testLogs = testLogs;
	}

	@Override
	public String toString() {
		return "TestAuditTrailsApiResponseBean [networkLogs=" + networkLogs + ", pageVisits=" + pageVisits 
				+ ", lostFocusLog=" + lostFocusLog + ", testLogs=" + testLogs
				+ "]";
	}	
	
}
