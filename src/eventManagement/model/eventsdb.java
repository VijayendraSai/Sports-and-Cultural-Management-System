package eventManagement.model;
import java.sql.Date;

public class eventsdb {
	private int event_id;
    private String eventtype;
    private String title; 
    private Date startDate;
    private Date enddate;
    private String poster;
    private String logo;
    private String Inchargeone;
    private String Inchargetwo;
    private String descrip;
    private String rules;
    private int prices;
    private int maxstud;
    private int clubid;
    private String prizes;
    
    private String base64Image;
    
	public eventsdb(int event_id, String eventtype, String title, Date startDate, Date enddate, String poster,
			String logo, String inchargeone, String inchargetwo, String descrip, String rules, int prices, int maxstud,
			int clubid, String prizes) {
		super();
		this.event_id = event_id;
		this.eventtype = eventtype;
		this.title = title;
		this.startDate = startDate;
		this.enddate = enddate;
		this.poster = poster;
		this.logo = logo;
		this.Inchargeone = inchargeone;
		this.Inchargetwo = inchargetwo;
		this.descrip = descrip;
		this.rules = rules;
		this.prices = prices;
		this.maxstud = maxstud;
		this.clubid = clubid;
		this.prizes = prizes;
	}
	
	public String getBase64Image() {
        return base64Image;
    }
 
    public void setBase64Image(String base64Image) {
        this.base64Image = base64Image;
    }
 

	public eventsdb(int event_id, String title, Date startDate, Date enddate, String poster) {
		// TODO Auto-generated constructor stub
		super();
		System.out.println(title+"eventsdb");
		this.event_id = event_id;
		this.title = title;
		this.startDate = startDate;
		this.enddate = enddate;
		this.poster = poster;
	}


	public int getEvent_id() {
		return event_id;
	}
	public void setEvent_id(int event_id) {
		this.event_id = event_id;
	}
	public String getEventtype() {
		return eventtype;
	}
	public void setEventtype(String eventtype) {
		this.eventtype = eventtype;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEnddate() {
		return enddate;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public String getInchargeone() {
		return Inchargeone;
	}
	public void setInchargeone(String inchargeone) {
		Inchargeone = inchargeone;
	}
	public String getInchargetwo() {
		return Inchargetwo;
	}
	public void setInchargetwo(String inchargetwo) {
		Inchargetwo = inchargetwo;
	}
	public String getDescrip() {
		return descrip;
	}
	public void setDescrip(String descrip) {
		this.descrip = descrip;
	}
	public String getRules() {
		return rules;
	}
	public void setRules(String rules) {
		this.rules = rules;
	}
	public int getPrices() {
		return prices;
	}
	public void setPrices(int prices) {
		this.prices = prices;
	}
	public int getMaxstud() {
		return maxstud;
	}
	public void setMaxstud(int maxstud) {
		this.maxstud = maxstud;
	}
	public int getClubid() {
		return clubid;
	}
	public void setClubid(int clubid) {
		this.clubid = clubid;
	}
	public String getPrizes() {
		return prizes;
	}
	public void setPrizes(String prizes) {
		this.prizes = prizes;
	}
    
}
