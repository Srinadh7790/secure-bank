package com.bank.securebank;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BankController {

    @GetMapping("/")
    public String home() {
        return "Welcome to Secure Bank";
    }

    @GetMapping("/balance")
    public String balance() {
        return "Account Balance: Rs. 50,000";
    }
}
