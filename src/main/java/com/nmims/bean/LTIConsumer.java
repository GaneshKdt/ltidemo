package com.nmims.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name="lti.lti_consumers")
@Getter @Setter @NoArgsConstructor
public class LTIConsumer implements Serializable {

	private int id; 
	@Column(name = "tool_consumer_info_product_family_code") 
	private String tool_consumer_info_product_family_code;
	
	@Column(name = "tool_consumer_info_version") 
	private String tool_consumer_info_version;
	
	@Column(name = "tool_consumer_info_version") 
	private String tool_consumer_instance_contact_email;
	
	private String tool_consumer_instance_description;
	
	private String tool_consumer_instance_guid;
	
	private String tool_consumer_instance_name;
	
	private String tool_consumer_instance_url;
	
}
