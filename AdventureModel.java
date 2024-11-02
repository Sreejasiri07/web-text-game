package web_text_game;

import java.util.HashMap;


public class AdventureModel {
//	private Room rooms[];
//	 private Thing things[];
//	 private Adventurer adventurer;
//	 private Wall walls[];
//	 private Water waters[];
	
	public boolean checkPathExist(String path , Location loc) {
		 
		 HashMap<String ,Location> hm = loc.getRoomDir();
		 if(hm.containsKey(path)) {
		 if(hm.get(path) instanceof Room)
		 return true;
		        }   
		 return false;
		        }
		 
		 public Location adventurerNextLocation(String path , Location loc) {
		 
		 HashMap<String ,Location> hm = loc.getRoomDir();
		 if(hm.containsKey(path)) {
		 if(hm.get(path) instanceof Room)
		 return hm.get(path);
		        }
		 return loc;
		 
		    }

}
