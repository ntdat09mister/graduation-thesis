package danny.store.dannystore.config;

import danny.store.dannystore.util.JWTTokenEnhancer;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.oauth2.provider.token.TokenEnhancer;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.oauth2.provider.token.store.JwtAccessTokenConverter;
import org.springframework.security.oauth2.provider.token.store.JwtTokenStore;
import org.springframework.security.oauth2.provider.token.store.KeyStoreKeyFactory;

@Configuration
@RequiredArgsConstructor
public class JWTTokenStoreConfig {
    private final ServiceConfig serviceConfig;

    /**
     * Signing our access token by asymmetric keypair from keystore file
     * @return JwtAccessTokenConverter
     */
    @Bean
    public JwtAccessTokenConverter jwtAccessTokenConverter() {
        JwtAccessTokenConverter converter = new JwtAccessTokenConverter();
        converter.setKeyPair(
                new KeyStoreKeyFactory(
                        serviceConfig.getKeyStoreFile(),
                        serviceConfig.getKeyStorePassword().toCharArray()
                ).getKeyPair(serviceConfig.getKeyStoreAlias()));
        return converter;
    }

    @Bean
    public TokenEnhancer jwtTokenEnhancer() {
        return new JWTTokenEnhancer();
    }

    @Bean
    public TokenStore tokenStore() {
        return new JwtTokenStore(jwtAccessTokenConverter());
    }
}
