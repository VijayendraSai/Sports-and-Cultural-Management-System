package eventManagement.model;

import java.sql.Timestamp;

public class users_registered_events {
	
	private int reg_id;
	private int event_id;
    private String Username;
    private Timestamp Reg_Date_time;
    
    public users_registered_events(int reg_id, int event_id, String username, Timestamp reg_Date_time) {
		super();
		this.reg_id = reg_id;
		this.event_id = event_id;
		Username = username;
		Reg_Date_time = reg_Date_time;
	}
    
    public users_registered_events(int event_id, String username, Timestamp reg_Date_time) {
		super();
		this.event_id = event_id;
		Username = username;
		Reg_Date_time = reg_Date_time;
	}
    
    public int getReg_id() {
		return reg_id;
	}
	public void setReg_id(int event_id) {
		this.reg_id = reg_id;
	}
    
	public int getEvent_id() {
		return event_id;
	}
	public void setEvent_id(int event_id) {
		this.event_id = event_id;
	}
	public String getUsername() {
		return Username;
	}
	public void setUsername(String username) {
		Username = username;
	}
	public Timestamp getReg_Date_time() {
		return Reg_Date_time;
	}
	public void setReg_Date_time(Timestamp reg_Date_time) {
		Reg_Date_time = reg_Date_time;
	} 
}
