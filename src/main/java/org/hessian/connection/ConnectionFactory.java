package org.hessian.connection;

import com.caucho.hessian.client.HessianProxyFactory;
import org.hessian.inter.HessianServerInterface;

public class ConnectionFactory {

    private static HessianProxyFactory hessianProxyFactory;

    private static HessianServerInterface serverProxy;

    public ConnectionFactory() {

    }

    public static HessianServerInterface getNewConnection() {
        try {
            System.out.println("Getting new connection");
            hessianProxyFactory = new HessianProxyFactory();
            hessianProxyFactory.setHessian2Request(true);
            String url = ("http://localhost:8080" +
                    "/HessianJavaServer" + "/books");
            serverProxy = (HessianServerInterface) hessianProxyFactory.create(HessianServerInterface.class,url);
            return serverProxy;
        }catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static HessianServerInterface getConnection() {
        if (serverProxy == null) {
            return getNewConnection();
        }
        return serverProxy;
    }
}
