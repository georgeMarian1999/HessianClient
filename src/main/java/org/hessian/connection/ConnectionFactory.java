package org.hessian.connection;

import com.caucho.hessian.client.HessianProxyFactory;
import org.hessian.inter.HessianServerInterface;

public class ConnectionFactory {

    private static HessianProxyFactory hessianProxyFactory;

    private static HessianServerInterface serverProxy;

    public ConnectionFactory() {

    }

    public static HessianServerInterface getNewConnection(String server) {
        try {
            System.out.println("Getting new connection");
            hessianProxyFactory = new HessianProxyFactory();
            hessianProxyFactory.setHessian2Request(true);
            String serverURL = "";
            if(server.equals("Java")) {
                serverURL = ":8080/Hessian"+ server;
            }
            else serverURL = ":80/Hessian" + server;
            String URL = ("http://localhost" +
                     serverURL+"Server" + "/books");
            if(server.equals("Php")) {
                URL = URL + ".php";
            }
            serverProxy = (HessianServerInterface) hessianProxyFactory.create(HessianServerInterface.class,URL);
            return serverProxy;
        }catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static HessianServerInterface getConnection(String server) {
        return getNewConnection(server);
    }
}
