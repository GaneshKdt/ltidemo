package com.nmims.helpers.openSAML;

import java.util.Base64;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.opensaml.core.config.InitializationException;
import org.opensaml.messaging.context.MessageContext;
import org.opensaml.saml.common.SAMLObject;
import org.opensaml.saml.saml2.core.Response;
import org.opensaml.saml.saml2.metadata.EntityDescriptor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.nmims.bean.MettlSSODetails;
import com.nmims.bean.StudentLtidemoBean;
import com.nmims.dao.PostDao;

@Component
public class MettlSamlRequestHelper {

	@Value( "${SERVER}" )
	private String SERVER;
	
	private static final Logger logger = LoggerFactory.getLogger(MettlSamlRequestHelper.class);

	@Autowired
	ArtifactResolver artifactResolver;
	
	@Autowired
	MetadataGenerator metadataGenerator;
	
	@Autowired
	PostDao PostDao;
	
	public void generateSamlRequest(String samlRequest, HttpServletRequest servletRequest, ModelAndView modelAndView, StudentLtidemoBean studentInfo) {

		// Initialize at top level.
		ArtifactResolver.init();
		MessageContext<SAMLObject> context = new MessageContext<SAMLObject>();
		MettlSSODetails authnRequestFields = artifactResolver.getMettlSSOFields(samlRequest, servletRequest);

		authnRequestFields.setStudentInfo(studentInfo);

		logger.info("\n"+SERVER+": "+new Date()+" mettl_sso authnRequestFields : "+authnRequestFields);
		
		modelAndView.addObject("redirectURL" , authnRequestFields.getDestinationURL());
		
		Response response = artifactResolver.generateSAMLResponse(authnRequestFields);
		context.setMessage(response);
		
		String responseString = OpenSAMLUtils.getSAMLString(response);

		modelAndView.addObject("SAMLResponse" , encodeBase64(responseString));
		modelAndView.addObject("SAMLResponseString" , responseString);

		logger.info("\n"+SERVER+": "+new Date()+" mettl_sso SAMLResponseString : "+responseString);
	}
	
	public String generateMetadata() throws InitializationException {
		MetadataGenerator.init();

		EntityDescriptor entityDescriptor = metadataGenerator.generateMetadata();
		String responseString = OpenSAMLUtils.getSAMLString(entityDescriptor);
		return responseString;
	}
	
	private String encodeBase64(String s) {
		return Base64.getEncoder().encodeToString(s.getBytes());
	}
}
