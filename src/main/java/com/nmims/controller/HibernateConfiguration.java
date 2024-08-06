package com.nmims.controller;

import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;

import org.springframework.orm.hibernate5.HibernateTransactionManager;

import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;


import com.nmims.bean.*;


import com.nmims.bean.CommentReactionsLtidemoBean;
import com.nmims.bean.ContentBeanLtidemoBean;
import com.nmims.bean.MentionedUsersBean;
import com.nmims.bean.ProgramSemSubjectBean;
import com.nmims.bean.SessionBean;
import com.nmims.bean.TimeBoundStudentMapping;






@Configuration
@EnableScheduling
@EnableTransactionManagement
@ComponentScan({ "ltidemo.controller" })
@PropertySource(value = { "file:c:/NMIMS_PROPERTY_FILE/ngasce.properties" })

public class HibernateConfiguration {
 
    @Autowired
    private Environment environment;
 
   
    
    @Autowired
    @Bean(name = "sessionFactory")
    public SessionFactory getSessionFactory(DataSource dataSource) {

    	LocalSessionFactoryBuilder sessionBuilder = new LocalSessionFactoryBuilder(dataSource);

    	sessionBuilder.addAnnotatedClasses(com.nmims.bean.Post.class);
    	sessionBuilder.addAnnotatedClasses(com.nmims.bean.APIListBean.class);
    	sessionBuilder.addAnnotatedClasses(com.nmims.bean.FacultyLtidemoBean.class);
    	sessionBuilder.addAnnotatedClasses(com.nmims.bean.UsersLtidemoBean.class);
    	sessionBuilder.addAnnotatedClasses(com.nmims.bean.StudentLtidemoBean.class);
    	sessionBuilder.addAnnotatedClasses(com.nmims.bean.ProgramSubject.class);


    	sessionBuilder.addAnnotatedClasses(com.nmims.bean.ConsumerProgramStructureLtidemoBean.class);
    	sessionBuilder.addAnnotatedClasses(com.nmims.bean.ConsumerTypes.class);
    	sessionBuilder.addAnnotatedClasses(com.nmims.bean.ProgramSemSubject.class);
    	sessionBuilder.addAnnotatedClasses(com.nmims.bean.ProgramStructure.class);
    	sessionBuilder.addAnnotatedClasses(com.nmims.bean.Programs.class);
    	//sessionBuilder.addAnnotatedClasses(ltidemo.bean.PostProgramSemSubject.class);

    	sessionBuilder.addAnnotatedClasses(com.nmims.bean.Assignment.class);
    	sessionBuilder.addAnnotatedClasses(com.nmims.bean.AssignmentLiveSettingLtidemo.class);
    	sessionBuilder.addAnnotatedClasses(com.nmims.bean.VideoContent.class);

    	sessionBuilder.addAnnotatedClass(com.nmims.bean.StudentMarksLtidemoBean.class);
    	sessionBuilder.addAnnotatedClass(com.nmims.bean.Registration.class);
    	sessionBuilder.addAnnotatedClass(com.nmims.bean.ExamOrderBean.class);
    	sessionBuilder.addAnnotatedClass(com.nmims.bean.ProgramSubjectMappingBean.class);
    	sessionBuilder.addAnnotatedClass(com.nmims.bean.StudentSubjectConfig.class);
    	sessionBuilder.addAnnotatedClass(com.nmims.bean.CommentsLtidemoBean.class);
    	sessionBuilder.addAnnotatedClass(com.nmims.bean.GroupBean.class);
    	sessionBuilder.addAnnotatedClass(com.nmims.bean.GroupsMembers.class);
    	sessionBuilder.addAnnotatedClass(com.nmims.bean.PostReactionsLtidemoBean.class);
    	sessionBuilder.addAnnotatedClass(com.nmims.bean.Hashtag.class);
    	sessionBuilder.addAnnotatedClass(com.nmims.bean.PostReportList.class);
    	
    	sessionBuilder.addAnnotatedClass(com.nmims.bean.ChatUserBean.class);
    	sessionBuilder.addAnnotatedClass(ProgramSemSubjectBean.class);
    	sessionBuilder.addAnnotatedClass(TimeBoundStudentMapping.class);
    	sessionBuilder.addAnnotatedClass(CommentReactionsLtidemoBean.class); 
    	sessionBuilder.addAnnotatedClass(ContentBeanLtidemoBean.class);

    	sessionBuilder.addAnnotatedClass(HarvardBean.class);

    	sessionBuilder.addAnnotatedClass(MentionedUsersBean.class);


    	sessionBuilder.addAnnotatedClass(SessionBean.class);

    	sessionBuilder.addAnnotatedClass(UserResourseMapping.class);

    	sessionBuilder.addAnnotatedClass(Pages.class);
    	sessionBuilder.addAnnotatedClass(NetworkLogsBean.class);
    	sessionBuilder.addAnnotatedClass(StudentDeviceDetails.class);
    	sessionBuilder.addAnnotatedClass(UserPageVisit.class);
    	sessionBuilder.addAnnotatedClass(DownloadLogsBean.class);
    	sessionBuilder.addAnnotatedClass(MettlScheduleBean.class);
    	sessionBuilder.addAnnotatedClass(MettlScheduleTempTableBean.class);
    	sessionBuilder.addAnnotatedClass(TimeboundUserMapping.class);
    	sessionBuilder.addAnnotatedClass(MBAWXStudentAssessmentResult.class);
    	sessionBuilder.addAnnotatedClass(MBAXMettlScheduleBean.class);
    	
    	sessionBuilder.addAnnotatedClass(MBAXStudentAssessmentResult.class);
    	sessionBuilder.addAnnotatedClass(MBAWXStudentExamBooking.class);
    	sessionBuilder.addAnnotatedClass(LTIUserResourcesMapping.class);
    	sessionBuilder.addAnnotatedClass(LTIUsers.class);
    	sessionBuilder.addAnnotatedClass(PGExamBookingBean.class);

    	sessionBuilder.addAnnotatedClass(MBAXStudentExamBooking.class);
    	
    	return sessionBuilder.buildSessionFactory();
    }
     
    @Bean(name = "dataSource")
    public DataSource getDataSource() {
        BasicDataSource dataSource = new BasicDataSource();
        dataSource.setDriverClassName(environment.getProperty("mysql.datasource.driver-class-name"));
        dataSource.setUrl(environment.getProperty("mysql.datasource.url") + "/lti");
        dataSource.setUsername(environment.getProperty("mysql.datasource.username"));
        dataSource.setPassword(environment.getProperty("mysql.datasource.password"));
     
        return dataSource;
    }
    @Bean(name = "multipartResolver")
    public CommonsMultipartResolver getCommonsMultipartResolver() {
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
        multipartResolver.setMaxUploadSize(209715200);   // 200MB
        multipartResolver.setMaxInMemorySize(2097152);  // 2MB
        return multipartResolver;
    }
    
    private Properties hibernateProperties() {
        Properties properties = new Properties();
        properties.put("hibernate.dialect", environment.getRequiredProperty("hibernate.dialect"));
        properties.put("hibernate.show_sql", environment.getRequiredProperty("hibernate.show_sql"));
        properties.put("hibernate.format_sql", environment.getRequiredProperty("hibernate.format_sql"));
        return properties;        
    }
     
    @Bean
    @Autowired
    public HibernateTransactionManager transactionManager(SessionFactory s) {
       HibernateTransactionManager txManager = new HibernateTransactionManager();
       txManager.setSessionFactory(s);
       return txManager;
    }
}
