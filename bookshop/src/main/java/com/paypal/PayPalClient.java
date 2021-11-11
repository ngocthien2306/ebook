package com.paypal;

import com.paypal.core.PayPalEnvironment;
import com.paypal.core.PayPalHttpClient;

public class PayPalClient {

    /**
     * Set up the PayPal Java SDK environment with PayPal access credentials. This
     * sample uses SandboxEnvironment. In production, use LiveEnvironment.
     */
    private PayPalEnvironment environment = new PayPalEnvironment.Sandbox(
            "AQ5g8nn9aROkHblV7Ljd5PJKV5Tr_cmh4WE6HrGy0GRCUyHOQKuQ7lOqMCdX9D31pAVSVcryYpROoTGY",
            "EE8LSN0co71gDM1tToGENWX2RoX9xxQSH1Zc2I5fqKBVVynLcg1KxNkm3btBVP0qJ4ohbxC");

    /**
     * PayPal HTTP client instance with environment that has access credentials
     * context. Use to invoke PayPal APIs.
     */
    PayPalHttpClient client = new PayPalHttpClient(environment);

    /**
     * Method to get client object
     *
     * @return PayPalHttpClient client
     */
    public PayPalHttpClient client() {
        return this.client;
    }
}