package com.nmims.helpers.openSAML;

import org.opensaml.core.config.InitializationException;
import org.opensaml.core.config.InitializationService;
import org.opensaml.saml.common.xml.SAMLConstants;
import org.opensaml.saml.saml2.metadata.ArtifactResolutionService;
import org.opensaml.saml.saml2.metadata.EncryptionMethod;
import org.opensaml.saml.saml2.metadata.EntityDescriptor;
import org.opensaml.saml.saml2.metadata.IDPSSODescriptor;
import org.opensaml.saml.saml2.metadata.KeyDescriptor;
import org.opensaml.saml.saml2.metadata.NameIDFormat;
import org.opensaml.saml.saml2.metadata.SingleSignOnService;
import org.opensaml.security.credential.Credential;
import org.opensaml.security.credential.UsageType;
import org.opensaml.xmlsec.encryption.KeySize;
import org.opensaml.xmlsec.encryption.support.EncryptionConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class MetadataGenerator {

	@Autowired
	private OpenSAMLSignatureFieldsGenerator signatureFieldsGenerator;


	@Value("${METTL_METADATA_LOCATION}")
	private String METTL_METADATA_LOCATION;

	@Value("${METTL_IDP_SERVICE_LOCATION}")
	private String METTL_IDP_SERVICE_LOCATION;

	
	public static void init() throws InitializationException{
		InitializationService.initialize();
	}

	public EntityDescriptor generateMetadata() {
		EntityDescriptor idpEntityDescriptor = OpenSAMLUtils.buildSAMLObject(EntityDescriptor.class);
		idpEntityDescriptor.setEntityID(METTL_METADATA_LOCATION);
		IDPSSODescriptor idpSSODescriptor = getIDPSSODescriptor();
		idpEntityDescriptor.getRoleDescriptors().add(idpSSODescriptor);
		return idpEntityDescriptor;
	}
	
	private IDPSSODescriptor getIDPSSODescriptor() {
		IDPSSODescriptor idpSSODescriptor = OpenSAMLUtils.buildSAMLObject(IDPSSODescriptor.class);
		idpSSODescriptor.addSupportedProtocol(SAMLConstants.SAML20P_NS);
		idpSSODescriptor.setWantAuthnRequestsSigned(false);
		idpSSODescriptor.getKeyDescriptors().add(getSigningKeyDescriptor());
		idpSSODescriptor.getKeyDescriptors().add(getEncryptionKeyDescriptor());
		idpSSODescriptor.getArtifactResolutionServices().add(getArtifactResolutionServicePOST());
		idpSSODescriptor.getArtifactResolutionServices().add(getArtifactResolutionServiceRedirect());
		idpSSODescriptor.getNameIDFormats().add(getNameIdFormat());
		idpSSODescriptor.getSingleSignOnServices().add(getPostSingleSignOnService());
		idpSSODescriptor.getSingleSignOnServices().add(getRedirectSingleSignOnService());
		return idpSSODescriptor;
	}

	private KeyDescriptor getSigningKeyDescriptor() {
		KeyDescriptor signingKeyDescriptor = OpenSAMLUtils.buildSAMLObject(KeyDescriptor.class);
		signingKeyDescriptor.setUse(UsageType.SIGNING);
		Credential credential = signatureFieldsGenerator.getCredential();
		signingKeyDescriptor.setKeyInfo(signatureFieldsGenerator.getKeyInfo(credential));
		return signingKeyDescriptor;
	}

	private KeyDescriptor getEncryptionKeyDescriptor() {
		KeyDescriptor encryptionKeyDescriptor = OpenSAMLUtils.buildSAMLObject(KeyDescriptor.class);
		encryptionKeyDescriptor.setUse(UsageType.ENCRYPTION);
		Credential credential = signatureFieldsGenerator.getCredential();
		encryptionKeyDescriptor.setKeyInfo(signatureFieldsGenerator.getKeyInfo(credential));
		encryptionKeyDescriptor.getEncryptionMethods().add(getEncryptionMethod());
		return encryptionKeyDescriptor;
	}
	
	private EncryptionMethod getEncryptionMethod() {
		EncryptionMethod encryptionMethod = OpenSAMLUtils.buildSAMLObject(EncryptionMethod.class);
		encryptionMethod.setAlgorithm(EncryptionConstants.ALGO_ID_BLOCKCIPHER_AES128);
		KeySize keySize = OpenSAMLUtils.buildSAMLObject(KeySize.class);
		keySize.setValue(128);
		encryptionMethod.setKeySize(keySize);
		return encryptionMethod;
	}

	private ArtifactResolutionService getArtifactResolutionServicePOST() {
		ArtifactResolutionService artifactResolutionService = OpenSAMLUtils.buildSAMLObject(ArtifactResolutionService.class);
		artifactResolutionService.setLocation(METTL_IDP_SERVICE_LOCATION);
		artifactResolutionService.setIndex(0);
		artifactResolutionService.setBinding(SAMLConstants.POST_METHOD);
		return artifactResolutionService;
	}
	
	private ArtifactResolutionService getArtifactResolutionServiceRedirect() {
		ArtifactResolutionService artifactResolutionService = OpenSAMLUtils.buildSAMLObject(ArtifactResolutionService.class);
		artifactResolutionService.setLocation(METTL_IDP_SERVICE_LOCATION);
		artifactResolutionService.setIndex(0);
		artifactResolutionService.setBinding(SAMLConstants.SAML2_REDIRECT_BINDING_URI);
		return artifactResolutionService;
	}

	private NameIDFormat getNameIdFormat() {
		NameIDFormat nameIdFormat = OpenSAMLUtils.buildSAMLObject(NameIDFormat.class);
		nameIdFormat.setFormat("urn:oasis:names:tc:SAML:2.0:nameid-format:unspecified");
		return nameIdFormat;
	}

	private SingleSignOnService getPostSingleSignOnService() {
		SingleSignOnService ssoService = OpenSAMLUtils.buildSAMLObject(SingleSignOnService.class);
		ssoService.setBinding(SAMLConstants.POST_METHOD);
		ssoService.setLocation(METTL_IDP_SERVICE_LOCATION);
		return ssoService;
	}
	private SingleSignOnService getRedirectSingleSignOnService() {
		SingleSignOnService ssoService = OpenSAMLUtils.buildSAMLObject(SingleSignOnService.class);
		ssoService.setBinding(SAMLConstants.SAML2_REDIRECT_BINDING_URI);
		ssoService.setLocation(METTL_IDP_SERVICE_LOCATION);
		return ssoService;
	}
}
