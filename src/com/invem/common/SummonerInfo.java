package com.invem.common;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;


public class SummonerInfo {
	static String subscriptionKey = ApiKey.API_KEY;

    static String host
    = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/";
    static String apiKey = "?api_key=" + ApiKey.API_KEY;


    public static String search (String name) throws Exception {

        name = name.replace(" ", "%20");
        String total = host + name + apiKey;
        URL url = new URL (total);

        HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
        connection.setRequestMethod("GET");
        connection.setDoOutput(true);

        StringBuilder response = new StringBuilder ();
        BufferedReader in = new BufferedReader(
            new InputStreamReader(connection.getInputStream()));

        String line;

        while ((line = in.readLine()) != null) {
          response.append(line);
        }
        in.close();

        System.out.println("소환사 이름 검색 : "+response.toString());
        return response.toString();
    }
}
