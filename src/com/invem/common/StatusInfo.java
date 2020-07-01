package com.invem.common;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;

public class StatusInfo {
	static String subscriptionKey = ApiKey.API_KEY;

	static String host = "https://kr.api.riotgames.com/lol/status/v3/shard-data";


	public static List<Message> search() throws Exception {
		String totalUrl = host + "?api_key=" + ApiKey.API_KEY;
		System.out.println(totalUrl);
		URL url = new URL(totalUrl);

		HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
		connection.setRequestMethod("GET");
		connection.setDoOutput(true);

		StringBuilder response = new StringBuilder();
		BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));

		String line;

		while ((line = in.readLine()) != null) {
			response.append(line);
		}
		in.close();
		System.out.println("게임 상태 조회 결과 : " + response.toString());
		Gson gson = new GsonBuilder().create();
		ShardState ss = gson.fromJson(response.toString(), ShardState.class);
		System.out.println("ss=" + ss);
		List<Service> serv = ss.getServices();
		List<Incident> incidents = null;
		
		for (Service service : serv) {
			if(service.getName().equals("Game")) {
				incidents = service.getIncidents();
				System.out.println("incidents="+incidents);
			}
		}
		List<Message> messages = new ArrayList<Message>();
		for (Incident incident : incidents) {
			List<Message> list = incident.getUpdates();
			//list = gson.fromJson(incident.getUpdates(), new TypeToken<List<Message>>(){}.getType());
			for(Message msg : list) {
				messages.add(msg);
				System.out.println("msg="+msg);
			}
		}
		
		
		String result = response.toString();
		return messages;
	}
}
