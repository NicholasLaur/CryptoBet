package model.betting;

import java.io.Serializable;
import java.util.ArrayList;

import model.footballdata.EsitoPartita;

public class SchemaDiScommessa implements Serializable{

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
		updateBonus();
		vincita_potenziale=(quota_totale*importo_giocato)+bonus;
		
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

	public void addEsito(EsitoPartita esitoSelezionato) {
		quota_totale*=esitoSelezionato.getQuota();
		numero_esiti++;
		updateBonus();
		vincita_potenziale=(quota_totale*importo_giocato)+bonus;
		esiti_giocati.add(esitoSelezionato);
	}

	public void removeEsito(EsitoPartita esito) {
		quota_totale/=esito.getQuota();
		numero_esiti--;
		updateBonus();
		vincita_potenziale=(quota_totale*importo_giocato)+bonus;
		for(EsitoPartita e: esiti_giocati) {
			if(e.getPartita().getCodice().equals(esito.getPartita().getCodice()) && e.getEsito().getDescrizione().equals(esito.getEsito().getDescrizione())) {
				esiti_giocati.remove(e);
				break;
			}
		}
	}

	public boolean canAdd(EsitoPartita esito) {
		// TODO Auto-generated method stub
		for(EsitoPartita e:esiti_giocati) {
			if(e.getPartita().getCodice().equals(esito.getPartita().getCodice()) 
					&& !(e.getEsito().getDescrizione().equals(esito.getEsito().getDescrizione())))
					return false;
		}
		return true;
	}

	

	public void updateBonus() {
		if(numero_esiti>=5) {
			bonus=(float) ((((numero_esiti/5.0)*20)*quota_totale*importo_giocato)/100);
		}
		else {
			bonus=0;
		}
	}
	
}
