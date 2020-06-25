package com.invem.champion.model;

public class AbilityVO {
	private int champno;
	private int c_level;
	private double attack;
	private double a_speed;
	private double health;
	private double mana;
	private double h_regeneration;
	private double m_regeneration;
	private double defense;
	private double m_defense;
	private int speed;
	private int crossroad;
	
	public int getChampno() {
		return champno;
	}
	public void setChampno(int champno) {
		this.champno = champno;
	}
	public int getC_level() {
		return c_level;
	}
	public void setC_level(int c_level) {
		this.c_level = c_level;
	}
	public double getAttack() {
		return attack;
	}
	public void setAttack(double attack) {
		this.attack = attack;
	}
	public double getA_speed() {
		return a_speed;
	}
	public void setA_speed(double a_speed) {
		this.a_speed = a_speed;
	}
	public double getHealth() {
		return health;
	}
	public void setHealth(double health) {
		this.health = health;
	}
	public double getMana() {
		return mana;
	}
	public void setMana(double mana) {
		this.mana = mana;
	}
	public double getH_regeneration() {
		return h_regeneration;
	}
	public void setH_regeneration(double h_regeneration) {
		this.h_regeneration = h_regeneration;
	}
	public double getM_regeneration() {
		return m_regeneration;
	}
	public void setM_regeneration(double m_regeneration) {
		this.m_regeneration = m_regeneration;
	}
	public double getDefense() {
		return defense;
	}
	public void setDefense(double defense) {
		this.defense = defense;
	}
	public double getM_defense() {
		return m_defense;
	}
	public void setM_defense(double m_defense) {
		this.m_defense = m_defense;
	}
	public int getSpeed() {
		return speed;
	}
	public void setSpeed(int speed) {
		this.speed = speed;
	}
	public int getCrossroad() {
		return crossroad;
	}
	public void setCrossroad(int crossroad) {
		this.crossroad = crossroad;
	}
	
	@Override
	public String toString() {
		return "AblityVO [champno=" + champno + ", c_level=" + c_level + ", attack=" + attack + ", a_speed=" + a_speed
				+ ", health=" + health + ", mana=" + mana + ", h_regeneration=" + h_regeneration + ", m_regeneration="
				+ m_regeneration + ", defense=" + defense + ", m_defense=" + m_defense + ", speed=" + speed
				+ ", crossroad=" + crossroad + "]";
	}
	
	public AbilityVO(int champno, int c_level, double attack, double a_speed, double health, double mana,
			double h_regeneration, double m_regeneration, double defense, double m_defense, int speed, int crossroad) {
		super();
		this.champno = champno;
		this.c_level = c_level;
		this.attack = attack;
		this.a_speed = a_speed;
		this.health = health;
		this.mana = mana;
		this.h_regeneration = h_regeneration;
		this.m_regeneration = m_regeneration;
		this.defense = defense;
		this.m_defense = m_defense;
		this.speed = speed;
		this.crossroad = crossroad;
	}
	
	public AbilityVO() {
		super();
	}
	
}
