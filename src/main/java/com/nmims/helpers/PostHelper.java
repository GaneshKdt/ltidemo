package com.nmims.helpers;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.nmims.bean.Post;

@Component
public class PostHelper {

	@Value("${SERVER_PATH}")
	private String SERVER_PATH;
	
	@Async
	public void refreshRedis(Post post) {
		RestTemplate restTemplate = new RestTemplate();
		try {
	  	    String url = SERVER_PATH+"timeline/api/post/refreshRedisDataByTimeboundIdForAllIntances";
			HttpHeaders headers = new HttpHeaders();
			headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
			HttpEntity<Post> entity = new HttpEntity<Post>(post,headers);
			  
			 String responseToApiCall = restTemplate.exchange(url, HttpMethod.POST, entity, String.class).getBody();
		} catch (RestClientException e) {
			e.printStackTrace();
		}
	}

}
