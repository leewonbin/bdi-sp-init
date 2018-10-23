package com.bdi.sp.vo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.ObjectMapper;

public class Naver {
	static ObjectMapper om = new ObjectMapper();
	
	private Message message;
	
	public Message getMessage() {
		return message;
	}
	public void setMessage(Message message) {
		this.message = message;
	}
	
	@JsonIgnoreProperties(ignoreUnknown=true)
	public class Message {
		private Result result;
		
		public Result getResult() {
			return result;
		}
		public void setResult(Result result) {
			this.result = result;
		}
		
		@JsonIgnoreProperties(ignoreUnknown=true)
		public class Result {
			private String translatedText;

			public String getTranslatedText() {
				return translatedText;
			}

			public void setTranslatedText(String translatedText) {
				this.translatedText = translatedText;
			}
		}
	}
}
