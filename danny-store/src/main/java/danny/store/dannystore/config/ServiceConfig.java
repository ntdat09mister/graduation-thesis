package danny.store.dannystore.config;

import lombok.Getter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Component;

@Configuration
@Component
@Getter
public class ServiceConfig {
    @Value("${security.oauth2.client.clientId}")
    private String clientId;

    @Value("${security.oauth2.client.clientSecret}")
    private String clientSecret;

    @Value("${security.oauth2.client.accessTokenValiditySeconds}")
    private int accessTokenValiditySeconds;

    @Value("${security.oauth2.client.refreshTokenValiditySeconds}")
    private int refreshTokenValiditySeconds;

    @Value("classpath:jwt.jks")
    private Resource keyStoreFile;

    @Value("${encrypt.keyStore.alias}")
    private String keyStoreAlias;

    @Value("${encrypt.keyStore.password}")
    private String keyStorePassword;
}
