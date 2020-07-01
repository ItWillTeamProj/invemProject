package com.invem.common;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;

public class LeagueInfo {
	static String subscriptionKey = ApiKey.API_KEY;

	static String host = "https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/";


	public static String search(String summonerId) throws Exception {
		String totalUrl = host + summonerId + "?api_key=" + ApiKey.API_KEY;
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
		System.out.println("랭크 조회 결과 : " + response.toString());
		
		String result = response.toString();
		return result;
	}
}
