package servlet;

import manager.FriendManager;
import manager.UserManager;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

@WebServlet(urlPatterns = "/user/home")
public class UserHomeServlet extends HttpServlet {
    private UserManager userManager = new UserManager();
    private FriendManager friendManager = new FriendManager();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        User user = (User) req.getSession().getAttribute("user");

        User userId = userManager.getUserById(user.getId());
        List<Integer> allRequestIdByUserId = friendManager.allRequestByUserId(userId.getId());
        List<User> allUsers = userManager.getAllUsers();
        List<Integer> allFriendsId = friendManager.allFriend(userId.getId());
        List<User> allFriends = new LinkedList<User>();
        allFriendsId.remove(user.getId());
        allRequestIdByUserId.remove(user.getId());
        allUsers.remove(user);
        List<User> notFriends = new LinkedList<User>();
        for (Integer allFriend : allFriendsId) {
            User userById = userManager.getUserById(allFriend);
            allFriends.add(userById);
        }
        List<User> allRequestByUserId = new LinkedList<User>();
        for (Integer usersIdByRequest : allRequestIdByUserId) {
            User userById = userManager.getUserById(usersIdByRequest);
            allRequestByUserId.add(userById);
        }

        for (User allUser : allUsers) {
            for (User allFriend : allFriends) {
                if (allUser.getId() == allFriend.getId()) {
                    allUsers.remove(allUser);
                }
            }
        }

        for (User allUser : allUsers) {
            if (allRequestByUserId.size() == 0) {
                notFriends.add(allUser);
            } else {
                for (User allRequest : allRequestByUserId) {
                    if (allUser.getId() != allRequest.getId()) {
                        notFriends.add(allUser);
                    }
                }
            }
        }
        req.setAttribute("request", allRequestByUserId);
        req.setAttribute("allFriends", allFriends);
        req.setAttribute("notFriends", notFriends);
        req.setAttribute("user", user);
        req.getRequestDispatcher("/WEB-INF/user.jsp").forward(req, resp);
    }
}
