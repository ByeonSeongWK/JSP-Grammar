package user;

public class UserBean {
		
		private String id;
		private String pw;
		
		// 기본 생성자는 반드시 매개변수가 없는 생성자를 하나 만들어야한다.(자바빈 규칙 >>> 그래야 인식한다.)
		public UserBean() {}
		
		// 기본 생성자
		public UserBean(String id, String pw) {
			this.id = id;
			this.pw = pw;
		}
		
		// 매개변수에  대한 getter, setter
		public void setId(String id) {
			this.id = id;
		}
		
		public String getId() {
			return id;
		}
		
		public String getPw() {
			return pw;
		}
		
		public void setPw(String pw) {
			this.pw = pw;
		}
		
		
	
}
