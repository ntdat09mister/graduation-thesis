package danny.store.dannystore.config;

import danny.store.dannystore.service.CustomUserDetailsService;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.config.annotation.configurers.ClientDetailsServiceConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configuration.AuthorizationServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableAuthorizationServer;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerEndpointsConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.token.TokenEnhancer;
import org.springframework.security.oauth2.provider.token.TokenEnhancerChain;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.oauth2.provider.token.store.JwtAccessTokenConverter;

import java.util.Arrays;

@Configuration
@EnableResourceServer
@EnableAuthorizationServer
@RequiredArgsConstructor
public class JWTOAuth2Config extends AuthorizationServerConfigurerAdapter {
    private final ServiceConfig serviceConfig;

    private final TokenStore tokenStore;

    private final AuthenticationManager authenticationManagerBean;

    private final CustomUserDetailsService userDetailsService;

    private final JwtAccessTokenConverter jwtAccessTokenConverter;

    public final TokenEnhancer jwtTokenEnhancer;

    private final PasswordEncoder passwordEncoder;

    @Override
    public void configure(ClientDetailsServiceConfigurer clients) throws Exception {
        clients.inMemory()
                .withClient(serviceConfig.getClientId())
                .secret(passwordEncoder.encode(serviceConfig.getClientSecret()))
                .authorizedGrantTypes("refresh_token", "password")
                .scopes("ui")
                .accessTokenValiditySeconds(serviceConfig.getAccessTokenValiditySeconds())
                .refreshTokenValiditySeconds(serviceConfig.getRefreshTokenValiditySeconds());
    }

    @Override
    public void configure(AuthorizationServerEndpointsConfigurer endpoints) {
        TokenEnhancerChain tokenEnhancerChain = new TokenEnhancerChain();
        tokenEnhancerChain.setTokenEnhancers(Arrays.asList(
                jwtTokenEnhancer,
                jwtAccessTokenConverter
        ));
        endpoints
                .tokenStore(tokenStore)
                .tokenEnhancer(tokenEnhancerChain)
                .authenticationManager(authenticationManagerBean)
                .userDetailsService(userDetailsService);
    }

    @Override
    public void configure(AuthorizationServerSecurityConfigurer oauthServer) {
        oauthServer
                .tokenKeyAccess("permitAll()")
                .checkTokenAccess("isAuthenticated()")
                .passwordEncoder(passwordEncoder);
    }
}
