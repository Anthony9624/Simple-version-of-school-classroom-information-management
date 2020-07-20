package myUtils;

public class ComVariable {
	
	private String[] deptnames = {"计算机与信息技术学院", "生命科学学院", 
			  "法学院", "化学化工学院", "文学院", 
			   "地理科学学院", "教育学院"};
	private String[] teacherTitles = {"助教", "讲师", "副教授", "教授"};
	private String[] devices = {"多媒体", "普通"};
	private String[] weekDays = {"星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"};
	private String[] periods = {"一二节", "三四节", "五六节", "七八节", "九十节"};
		
	public ComVariable() {
	}
	
	public String[] getDeptnames() {
		return deptnames;
	}
	
	public String[] getTeacherTitles() {
		return teacherTitles;
	}
	
	public String[] getDevices() {
		return devices;
	}
	
	public String[] getWeekDays() {
		return weekDays;
	}
	
	public String[] getPeriods() {
		return periods;
	}
	
	public String getDeptnameString() {
		StringBuffer strBuffer = new StringBuffer(""); 
		for(int i = 0; i < deptnames.length; i++){
			strBuffer.append( "'"+deptnames[i]+"',");
		}
		String strTemp = strBuffer.toString(); 
		if(strTemp.endsWith(",")){ 
			strTemp = strTemp.substring(0, strTemp.length() - 1); 
		}
		return strTemp;
	}
	
}
