package com.lubo4551.www;

/**
 * AbstractDistributeId entity provides the base persistence definition of the
 * DistributeId entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractDistributeId implements java.io.Serializable {

	// Fields

	private String itemSerialNumber;
	private String itemName;
	private String identitySerialNumber;
	private String expertName;
	private String scoreZero;
	private String scoreOne;
	private String scoreTwo;
	private String scoreThree;
	private String scoreFour;
	private String scoreFive;
	private String scoreSix;
	private String mind;
	private String expertMind;

	// Constructors

	/** default constructor */
	public AbstractDistributeId() {
	}

	/** minimal constructor */
	public AbstractDistributeId(String itemSerialNumber) {
		this.itemSerialNumber = itemSerialNumber;
	}

	/** full constructor */
	public AbstractDistributeId(String itemSerialNumber, String itemName,
			String identitySerialNumber, String expertName, String scoreZero,
			String scoreOne, String scoreTwo, String scoreThree,
			String scoreFour, String scoreFive, String scoreSix, String mind,
			String expertMind) {
		this.itemSerialNumber = itemSerialNumber;
		this.itemName = itemName;
		this.identitySerialNumber = identitySerialNumber;
		this.expertName = expertName;
		this.scoreZero = scoreZero;
		this.scoreOne = scoreOne;
		this.scoreTwo = scoreTwo;
		this.scoreThree = scoreThree;
		this.scoreFour = scoreFour;
		this.scoreFive = scoreFive;
		this.scoreSix = scoreSix;
		this.mind = mind;
		this.expertMind = expertMind;
	}

	// Property accessors

	public String getItemSerialNumber() {
		return this.itemSerialNumber;
	}

	public void setItemSerialNumber(String itemSerialNumber) {
		this.itemSerialNumber = itemSerialNumber;
	}

	public String getItemName() {
		return this.itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getIdentitySerialNumber() {
		return this.identitySerialNumber;
	}

	public void setIdentitySerialNumber(String identitySerialNumber) {
		this.identitySerialNumber = identitySerialNumber;
	}

	public String getExpertName() {
		return this.expertName;
	}

	public void setExpertName(String expertName) {
		this.expertName = expertName;
	}

	public String getScoreZero() {
		return this.scoreZero;
	}

	public void setScoreZero(String scoreZero) {
		this.scoreZero = scoreZero;
	}

	public String getScoreOne() {
		return this.scoreOne;
	}

	public void setScoreOne(String scoreOne) {
		this.scoreOne = scoreOne;
	}

	public String getScoreTwo() {
		return this.scoreTwo;
	}

	public void setScoreTwo(String scoreTwo) {
		this.scoreTwo = scoreTwo;
	}

	public String getScoreThree() {
		return this.scoreThree;
	}

	public void setScoreThree(String scoreThree) {
		this.scoreThree = scoreThree;
	}

	public String getScoreFour() {
		return this.scoreFour;
	}

	public void setScoreFour(String scoreFour) {
		this.scoreFour = scoreFour;
	}

	public String getScoreFive() {
		return this.scoreFive;
	}

	public void setScoreFive(String scoreFive) {
		this.scoreFive = scoreFive;
	}

	public String getScoreSix() {
		return this.scoreSix;
	}

	public void setScoreSix(String scoreSix) {
		this.scoreSix = scoreSix;
	}

	public String getMind() {
		return this.mind;
	}

	public void setMind(String mind) {
		this.mind = mind;
	}

	public String getExpertMind() {
		return this.expertMind;
	}

	public void setExpertMind(String expertMind) {
		this.expertMind = expertMind;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof AbstractDistributeId))
			return false;
		AbstractDistributeId castOther = (AbstractDistributeId) other;

		return ((this.getItemSerialNumber() == castOther.getItemSerialNumber()) || (this
				.getItemSerialNumber() != null
				&& castOther.getItemSerialNumber() != null && this
				.getItemSerialNumber().equals(castOther.getItemSerialNumber())))
				&& ((this.getItemName() == castOther.getItemName()) || (this
						.getItemName() != null
						&& castOther.getItemName() != null && this
						.getItemName().equals(castOther.getItemName())))
				&& ((this.getIdentitySerialNumber() == castOther
						.getIdentitySerialNumber()) || (this
						.getIdentitySerialNumber() != null
						&& castOther.getIdentitySerialNumber() != null && this
						.getIdentitySerialNumber().equals(
								castOther.getIdentitySerialNumber())))
				&& ((this.getExpertName() == castOther.getExpertName()) || (this
						.getExpertName() != null
						&& castOther.getExpertName() != null && this
						.getExpertName().equals(castOther.getExpertName())))
				&& ((this.getScoreZero() == castOther.getScoreZero()) || (this
						.getScoreZero() != null
						&& castOther.getScoreZero() != null && this
						.getScoreZero().equals(castOther.getScoreZero())))
				&& ((this.getScoreOne() == castOther.getScoreOne()) || (this
						.getScoreOne() != null
						&& castOther.getScoreOne() != null && this
						.getScoreOne().equals(castOther.getScoreOne())))
				&& ((this.getScoreTwo() == castOther.getScoreTwo()) || (this
						.getScoreTwo() != null
						&& castOther.getScoreTwo() != null && this
						.getScoreTwo().equals(castOther.getScoreTwo())))
				&& ((this.getScoreThree() == castOther.getScoreThree()) || (this
						.getScoreThree() != null
						&& castOther.getScoreThree() != null && this
						.getScoreThree().equals(castOther.getScoreThree())))
				&& ((this.getScoreFour() == castOther.getScoreFour()) || (this
						.getScoreFour() != null
						&& castOther.getScoreFour() != null && this
						.getScoreFour().equals(castOther.getScoreFour())))
				&& ((this.getScoreFive() == castOther.getScoreFive()) || (this
						.getScoreFive() != null
						&& castOther.getScoreFive() != null && this
						.getScoreFive().equals(castOther.getScoreFive())))
				&& ((this.getScoreSix() == castOther.getScoreSix()) || (this
						.getScoreSix() != null
						&& castOther.getScoreSix() != null && this
						.getScoreSix().equals(castOther.getScoreSix())))
				&& ((this.getMind() == castOther.getMind()) || (this.getMind() != null
						&& castOther.getMind() != null && this.getMind()
						.equals(castOther.getMind())))
				&& ((this.getExpertMind() == castOther.getExpertMind()) || (this
						.getExpertMind() != null
						&& castOther.getExpertMind() != null && this
						.getExpertMind().equals(castOther.getExpertMind())));
	}

	public int hashCode() {
		int result = 17;

		result = 37
				* result
				+ (getItemSerialNumber() == null ? 0 : this
						.getItemSerialNumber().hashCode());
		result = 37 * result
				+ (getItemName() == null ? 0 : this.getItemName().hashCode());
		result = 37
				* result
				+ (getIdentitySerialNumber() == null ? 0 : this
						.getIdentitySerialNumber().hashCode());
		result = 37
				* result
				+ (getExpertName() == null ? 0 : this.getExpertName()
						.hashCode());
		result = 37 * result
				+ (getScoreZero() == null ? 0 : this.getScoreZero().hashCode());
		result = 37 * result
				+ (getScoreOne() == null ? 0 : this.getScoreOne().hashCode());
		result = 37 * result
				+ (getScoreTwo() == null ? 0 : this.getScoreTwo().hashCode());
		result = 37
				* result
				+ (getScoreThree() == null ? 0 : this.getScoreThree()
						.hashCode());
		result = 37 * result
				+ (getScoreFour() == null ? 0 : this.getScoreFour().hashCode());
		result = 37 * result
				+ (getScoreFive() == null ? 0 : this.getScoreFive().hashCode());
		result = 37 * result
				+ (getScoreSix() == null ? 0 : this.getScoreSix().hashCode());
		result = 37 * result
				+ (getMind() == null ? 0 : this.getMind().hashCode());
		result = 37
				* result
				+ (getExpertMind() == null ? 0 : this.getExpertMind()
						.hashCode());
		return result;
	}

}