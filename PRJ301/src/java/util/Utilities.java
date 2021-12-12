/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import javax.servlet.http.HttpServletRequest;
import model.Account;

/**
 *
 * @author namdh
 */
public class Utilities {

    public static boolean isAuthenticated(HttpServletRequest request) {
        if (request.getSession().getAttribute("user") == null
                || ((Account) request.getSession().getAttribute("user")).getUsername() == null) {
            return false;
        } else {
            return true;
        }
    }

}
