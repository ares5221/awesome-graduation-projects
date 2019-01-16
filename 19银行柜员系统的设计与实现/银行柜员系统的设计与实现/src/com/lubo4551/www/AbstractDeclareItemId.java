package com.lubo4551.www;

/**
 * AbstractDeclareItemId entity provides the base persistence definition of the
 * DeclareItemId entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractDeclareItemId implements java.io.Serializable {

	// Fields

	private String itemSerialNumber;
	private String unitSerialNumber;
	private String itemName;
	private String sortOne;
	private String sortTwo;
	private String beginDate;
	private String finishDate;
	private String applicant;
	private String grade;
	private String education;
	private String unitName;
	private String fillDate;
	private String purport;
	private String status;
	private String future;
	private String point;
	private String analysis;
	private String way;
	private String moment;
	private String result;
	private String reference;
	private String market;
	private String commendMind;
	private String expertMind;
	private String leadingMind;
	private String pass;

	// Constructors

	/** default constructor */
	public AbstractDeclareItemId() {
	}

	/** full constructor */
	public AbstractDeclareItemId(String itemSerialNumber,
			String unitSerialNumber, String itemName, String sortOne,
			String sortTwo, String beginDate, String finishDate,
			String applicant, String grade, String education, String unitName,
			String fillDate, String purport, String status, String future,
			String point, String analysis, String way, String moment,
			String result, String reference, String market, String commendMind,
			String expertMind, String leadingMind, String pass) {
		this.itemSerialNumber = itemSerialNumber;
		this.unitSerialNumber = unitSerialNumber;
		this.itemName = itemName;
		this.sortOne = sortOne;
		this.sortTwo = sortTwo;
		this.beginDate = beginDate;
		this.finishDate = finishDate;
		this.applicant = applicant;
		this.grade = grade;
		this.education = education;
		this.unitName = unitName;
		this.fillDate = fillDate;
		this.purport = purport;
		this.status = status;
		this.future = future;
		this.point = point;
		this.analysis = analysis;
		this.way = way;
		this.moment = moment;
		this.result = result;
		this.reference = reference;
		this.market = market;
		this.commendMind = commendMind;
		this.expertMind = expertMind;
		this.leadingMind = leadingMind;
		this.pass = pass;
	}

	// Property accessors

	public String getItemSerialNumber() {
		return this.itemSerialNumber;
	}

	public void setItemSerialNumber(String itemSerialNumber) {
		this.itemSerialNumber = itemSerialNumber;
	}

	public String getUnitSerialNumber() {
		return this.unitSerialNumber;
	}

	public void setUnitSerialNumber(String unitSerialNumber) {
		this.unitSerialNumber = unitSerialNumber;
	}

	public String getItemName() {
		return this.itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getSortOne() {
		return this.sortOne;
	}

	public void setSortOne(String sortOne) {
		this.sortOne = sortOne;
	}

	public String getSortTwo() {
		return this.sortTwo;
	}

	public void setSortTwo(String sortTwo) {
		this.sortTwo = sortTwo;
	}

	public String getBeginDate() {
		return this.beginDate;
	}

	public void setBeginDate(String beginDate) {
		this.beginDate = beginDate;
	}

	public String getFinishDate() {
		return this.finishDate;
	}

	public void setFinishDate(String finishDate) {
		this.finishDate = finishDate;
	}

	public String getApplicant() {
		return this.applicant;
	}

	public void setApplicant(String applicant) {
		this.applicant = applicant;
	}

	public String getGrade() {
		return this.grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getEducation() {
		return this.education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getUnitName() {
		return this.unitName;
	}

	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}

	public String getFillDate() {
		return this.fillDate;
	}

	public void setFillDate(String fillDate) {
		this.fillDate = fillDate;
	}

	public String getPurport() {
		return this.purport;
	}

	public void setPurport(String purport) {
		this.purport = purport;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getFuture() {
		return this.future;
	}

	public void setFuture(String future) {
		this.future = future;
	}

	public String getPoint() {
		return this.point;
	}

	public void setPoint(String point) {
		this.point = point;
	}

	public String getAnalysis() {
		return this.analysis;
	}

	public void setAnalysis(String analysis) {
		this.analysis = analysis;
	}

	public String getWay() {
		return this.way;
	}

	public void setWay(String way) {
		this.way = way;
	}

	public String getMoment() {
		return this.moment;
	}

	public void setMoment(String moment) {
		this.moment = moment;
	}

	public String getResult() {
		return this.result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getReference() {
		return this.reference;
	}

	public void setReference(String reference) {
		this.reference = reference;
	}

	public String getMarket() {
		return this.market;
	}

	public void setMarket(String market) {
		this.market = market;
	}

	public String getCommendMind() {
		return this.commendMind;
	}

	public void setCommendMind(String commendMind) {
		this.commendMind = commendMind;
	}

	public String getExpertMind() {
		return this.expertMind;
	}

	public void setExpertMind(String expertMind) {
		this.expertMind = expertMind;
	}

	public String getLeadingMind() {
		return this.leadingMind;
	}

	public void setLeadingMind(String leadingMind) {
		this.leadingMind = leadingMind;
	}

	public String getPass() {
		return this.pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof AbstractDeclareItemId))
			return false;
		AbstractDeclareItemId castOther = (AbstractDeclareItemId) other;

		return ((this.getItemSerialNumber() == castOther.getItemSerialNumber()) || (this
				.getItemSerialNumber() != null
				&& castOther.getItemSerialNumber() != null && this
				.getItemSerialNumber().equals(castOther.getItemSerialNumber())))
				&& ((this.getUnitSerialNumber() == castOther
						.getUnitSerialNumber()) || (this.getUnitSerialNumber() != null
						&& castOther.getUnitSerialNumber() != null && this
						.getUnitSerialNumber().equals(
								castOther.getUnitSerialNumber())))
				&& ((this.getItemName() == castOther.getItemName()) || (this
						.getItemName() != null
						&& castOther.getItemName() != null && this
						.getItemName().equals(castOther.getItemName())))
				&& ((this.getSortOne() == castOther.getSortOne()) || (this
						.getSortOne() != null && castOther.getSortOne() != null && this
						.getSortOne().equals(castOther.getSortOne())))
				&& ((this.getSortTwo() == castOther.getSortTwo()) || (this
						.getSortTwo() != null && castOther.getSortTwo() != null && this
						.getSortTwo().equals(castOther.getSortTwo())))
				&& ((this.getBeginDate() == castOther.getBeginDate()) || (this
						.getBeginDate() != null
						&& castOther.getBeginDate() != null && this
						.getBeginDate().equals(castOther.getBeginDate())))
				&& ((this.getFinishDate() == castOther.getFinishDate()) || (this
						.getFinishDate() != null
						&& castOther.getFinishDate() != null && this
						.getFinishDate().equals(castOther.getFinishDate())))
				&& ((this.getApplicant() == castOther.getApplicant()) || (this
						.getApplicant() != null
						&& castOther.getApplicant() != null && this
						.getApplicant().equals(castOther.getApplicant())))
				&& ((this.getGrade() == castOther.getGrade()) || (this
						.getGrade() != null && castOther.getGrade() != null && this
						.getGrade().equals(castOther.getGrade())))
				&& ((this.getEducation() == castOther.getEducation()) || (this
						.getEducation() != null
						&& castOther.getEducation() != null && this
						.getEducation().equals(castOther.getEducation())))
				&& ((this.getUnitName() == castOther.getUnitName()) || (this
						.getUnitName() != null
						&& castOther.getUnitName() != null && this
						.getUnitName().equals(castOther.getUnitName())))
				&& ((this.getFillDate() == castOther.getFillDate()) || (this
						.getFillDate() != null
						&& castOther.getFillDate() != null && this
						.getFillDate().equals(castOther.getFillDate())))
				&& ((this.getPurport() == castOther.getPurport()) || (this
						.getPurport() != null && castOther.getPurport() != null && this
						.getPurport().equals(castOther.getPurport())))
				&& ((this.getStatus() == castOther.getStatus()) || (this
						.getStatus() != null && castOther.getStatus() != null && this
						.getStatus().equals(castOther.getStatus())))
				&& ((this.getFuture() == castOther.getFuture()) || (this
						.getFuture() != null && castOther.getFuture() != null && this
						.getFuture().equals(castOther.getFuture())))
				&& ((this.getPoint() == castOther.getPoint()) || (this
						.getPoint() != null && castOther.getPoint() != null && this
						.getPoint().equals(castOther.getPoint())))
				&& ((this.getAnalysis() == castOther.getAnalysis()) || (this
						.getAnalysis() != null
						&& castOther.getAnalysis() != null && this
						.getAnalysis().equals(castOther.getAnalysis())))
				&& ((this.getWay() == castOther.getWay()) || (this.getWay() != null
						&& castOther.getWay() != null && this.getWay().equals(
						castOther.getWay())))
				&& ((this.getMoment() == castOther.getMoment()) || (this
						.getMoment() != null && castOther.getMoment() != null && this
						.getMoment().equals(castOther.getMoment())))
				&& ((this.getResult() == castOther.getResult()) || (this
						.getResult() != null && castOther.getResult() != null && this
						.getResult().equals(castOther.getResult())))
				&& ((this.getReference() == castOther.getReference()) || (this
						.getReference() != null
						&& castOther.getReference() != null && this
						.getReference().equals(castOther.getReference())))
				&& ((this.getMarket() == castOther.getMarket()) || (this
						.getMarket() != null && castOther.getMarket() != null && this
						.getMarket().equals(castOther.getMarket())))
				&& ((this.getCommendMind() == castOther.getCommendMind()) || (this
						.getCommendMind() != null
						&& castOther.getCommendMind() != null && this
						.getCommendMind().equals(castOther.getCommendMind())))
				&& ((this.getExpertMind() == castOther.getExpertMind()) || (this
						.getExpertMind() != null
						&& castOther.getExpertMind() != null && this
						.getExpertMind().equals(castOther.getExpertMind())))
				&& ((this.getLeadingMind() == castOther.getLeadingMind()) || (this
						.getLeadingMind() != null
						&& castOther.getLeadingMind() != null && this
						.getLeadingMind().equals(castOther.getLeadingMind())))
				&& ((this.getPass() == castOther.getPass()) || (this.getPass() != null
						&& castOther.getPass() != null && this.getPass()
						.equals(castOther.getPass())));
	}

	public int hashCode() {
		int result = 17;

		result = 37
				* result
				+ (getItemSerialNumber() == null ? 0 : this
						.getItemSerialNumber().hashCode());
		result = 37
				* result
				+ (getUnitSerialNumber() == null ? 0 : this
						.getUnitSerialNumber().hashCode());
		result = 37 * result
				+ (getItemName() == null ? 0 : this.getItemName().hashCode());
		result = 37 * result
				+ (getSortOne() == null ? 0 : this.getSortOne().hashCode());
		result = 37 * result
				+ (getSortTwo() == null ? 0 : this.getSortTwo().hashCode());
		result = 37 * result
				+ (getBeginDate() == null ? 0 : this.getBeginDate().hashCode());
		result = 37
				* result
				+ (getFinishDate() == null ? 0 : this.getFinishDate()
						.hashCode());
		result = 37 * result
				+ (getApplicant() == null ? 0 : this.getApplicant().hashCode());
		result = 37 * result
				+ (getGrade() == null ? 0 : this.getGrade().hashCode());
		result = 37 * result
				+ (getEducation() == null ? 0 : this.getEducation().hashCode());
		result = 37 * result
				+ (getUnitName() == null ? 0 : this.getUnitName().hashCode());
		result = 37 * result
				+ (getFillDate() == null ? 0 : this.getFillDate().hashCode());
		result = 37 * result
				+ (getPurport() == null ? 0 : this.getPurport().hashCode());
		result = 37 * result
				+ (getStatus() == null ? 0 : this.getStatus().hashCode());
		result = 37 * result
				+ (getFuture() == null ? 0 : this.getFuture().hashCode());
		result = 37 * result
				+ (getPoint() == null ? 0 : this.getPoint().hashCode());
		result = 37 * result
				+ (getAnalysis() == null ? 0 : this.getAnalysis().hashCode());
		result = 37 * result
				+ (getWay() == null ? 0 : this.getWay().hashCode());
		result = 37 * result
				+ (getMoment() == null ? 0 : this.getMoment().hashCode());
		result = 37 * result
				+ (getResult() == null ? 0 : this.getResult().hashCode());
		result = 37 * result
				+ (getReference() == null ? 0 : this.getReference().hashCode());
		result = 37 * result
				+ (getMarket() == null ? 0 : this.getMarket().hashCode());
		result = 37
				* result
				+ (getCommendMind() == null ? 0 : this.getCommendMind()
						.hashCode());
		result = 37
				* result
				+ (getExpertMind() == null ? 0 : this.getExpertMind()
						.hashCode());
		result = 37
				* result
				+ (getLeadingMind() == null ? 0 : this.getLeadingMind()
						.hashCode());
		result = 37 * result
				+ (getPass() == null ? 0 : this.getPass().hashCode());
		return result;
	}

}