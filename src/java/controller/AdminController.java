package controller;

import entity.Account;
import entity.Combo;
import entity.Promotion;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.DAOAccount;
import model.DAOCombo;
import model.DAOPromotion;

@WebServlet(name = "AdminController", urlPatterns = {"admin"})
public class AdminController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        // Check if user is logged in and has appropriate role
        if (account != null) {
            if (account.getRole().equals("Admin") || account.getRole().equals("Manager")) {
                request.getRequestDispatcher("/admin/indexAdmin.jsp").forward(request, response);
                DAOCombo comboDAO = new DAOCombo();
                DAOPromotion promotionDAO = new DAOPromotion();
                DAOAccount accountDAO = new DAOAccount();

                List<Combo> listCombo = comboDAO.getCombo("select * from Combo");
                List<Promotion> listPromotions = promotionDAO.getPromotion("select * from Promotion");
                List<Account> customers = accountDAO.getAllCustomers("select * from Account");

                request.setAttribute("listCombo", listCombo);
                request.setAttribute("list", listPromotions);
                request.setAttribute("customers", customers);

            } else {
                response.sendRedirect(request.getContextPath() + "/Error.jsp");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "login.jsp");

        }
    }
        @Override
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            doGet(request, response);
        }
    }
