package model;

import java.util.ArrayList;

public class SchemaDiScommessa {

	private float importo_giocato;
	private float quota_totale;
	private float bonus;
	private int numero_esiti;
	private float vincita_potenziale;
	private ArrayList<EsitoPartita> esiti_giocati;
	
	
	public SchemaDiScommessa(float importo_giocato, float quota_totale, float bonus, int numero_esiti,
			float vincita_potenziale, ArrayList<EsitoPartita> esiti_giocati) {
		this.importo_giocato = importo_giocato;
		this.quota_totale = quota_totale;
		this.bonus = bonus;
		this.numero_esiti = numero_esiti;
		this.vincita_potenziale = vincita_potenziale;
		this.esiti_giocati = esiti_giocati;
	}
	
	public float getImporto_giocato() {
		return importo_giocato;
	}
	
	public void setImporto_giocato(float importo_giocato) {
		this.importo_giocato = importo_giocato;
	}
	
	public float getQuota_totale() {
		return quota_totale;
	}
	
	public void setQuota_totale(float quota_totale) {
		this.quota_totale = quota_totale;
	}
	
	public float getBonus() {
		return bonus;
	}
	
	public void setBonus(float bonus) {
		this.bonus = bonus;
	}
	
	public int getNumero_esiti() {
		return numero_esiti;
	}
	
	public void setNumero_esiti(int numero_esiti) {
		this.numero_esiti = numero_esiti;
	}
	
	public float getVincita_potenziale() {
		return vincita_potenziale;
	}
	
	public void setVincita_potenziale(float vincita_potenziale) {
		this.vincita_potenziale = vincita_potenziale;
	}
	
	public ArrayList<EsitoPartita> getEsiti_giocati() {
		return esiti_giocati;
	}
	
	public void setEsiti_giocati(ArrayList<EsitoPartita> esiti_giocati) {
		this.esiti_giocati = esiti_giocati;
	}
	
}