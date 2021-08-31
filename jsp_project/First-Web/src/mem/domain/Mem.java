package mem.domain;

public class Mem {
	private int idx;
	private String id;
	private String pw;
	private String name;
	private String regdate;

	public Mem(int idx, String id, String pw, String name, String regdate) {
		this.idx = idx;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.regdate = regdate;
	}

	public Mem(String id, String pw, String name) {
		this.id = id;
		this.pw = pw;
		this.name = name;
	}

	public Mem() {

	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getId() {
		return id;
	}

	public void setid(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setpw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setname(String name) {
		this.name = name;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "Mem [idx=" + idx + ", id=" + id + ", pw=" + pw
				+ ", name="	+ name + ", regdate=" + regdate	+ "]";
	}
}
