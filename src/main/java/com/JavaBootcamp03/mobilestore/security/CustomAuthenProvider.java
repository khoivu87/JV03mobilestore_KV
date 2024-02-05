package com.JavaBootcamp03.mobilestore.security;

import com.JavaBootcamp03.mobilestore.entity.CustomerEntity;
import com.JavaBootcamp03.mobilestore.service.serviceInterface.CustomerServiceImp;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@NoArgsConstructor
@Service
public class CustomAuthenProvider implements AuthenticationProvider {
    @Autowired
    private CustomerServiceImp customerServiceImp;

    public CustomAuthenProvider(CustomerServiceImp customerServiceImp) {
        super();
        this.customerServiceImp = customerServiceImp;
    }

    @Override
    public Authentication authenticate(Authentication authentication) {
        String email = authentication.getPrincipal().toString();
        String password = authentication.getCredentials().toString();

        CustomerEntity customerEntity = customerServiceImp.checkLogin(email, password);

        if (customerEntity != null) {
            List<GrantedAuthority> listRoles = new ArrayList<>();

            SimpleGrantedAuthority role = new SimpleGrantedAuthority(customerEntity.getRoleCustomer().getName());
            listRoles.add(role);

            System.out.println("Kiem tra roles trong CustomAuthenProvider: " + listRoles);

            return new UsernamePasswordAuthenticationToken("", "", listRoles);
        }

        return null;
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }
}
