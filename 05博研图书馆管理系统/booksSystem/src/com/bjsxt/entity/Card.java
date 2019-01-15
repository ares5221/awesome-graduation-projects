package com.bjsxt.entity;

public class Card {
	private int id;
	private int validity;
	private double fees;

	public Card() {
		super();
	}

	public Card(int id, int validity, double fees) {
		super();
		this.id = id;
		this.validity = validity;
		this.fees = fees;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getValidity() {
		return validity;
	}

	public void setValidity(int validity) {
		this.validity = validity;
	}

	public double getFees() {
		return fees;
	}

	public void setFees(double fees) {
		this.fees = fees;
	}

}
