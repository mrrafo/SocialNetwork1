package manager;

import db.DBConnectionProvider;
import model.Relation;

import java.sql.*;
import java.util.LinkedList;
import java.util.List;

public class FriendManager {

    private Connection connection;

    public FriendManager() {
        connection = DBConnectionProvider.getInstance().getConnection();
    }


    public void addFriend(long userId, long friendId) {

        try {
            String query = "INSERT INTO user_friend(`user_id`,`friend_id`,`request`) " +
                    "VALUES(?,?,?);";
            PreparedStatement statement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            statement.setLong(1, userId);
            statement.setLong(2, friendId);
            statement.setString(3, Relation.FRIEND.name());
            statement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Integer> allFriend(long userId) {
        String query = "SELECT * FROM user_friend WHERE user_id = " + userId;
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            List<Integer> usersId = new LinkedList<Integer>();
            while (resultSet.next()) {
                if (resultSet.getString(3).equals(Relation.FRIEND.name())) {
                    usersId.add(resultSet.getInt(2));
                }

            }
            List<Integer> userFriendId = allFriendByUserId(userId);
            if (userFriendId != null) {
                for (Integer friendId : userFriendId) {

                    usersId.add(friendId);

                }

            }


            return usersId;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    private List<Integer> allFriendByUserId(long userId) {
        String query = "SELECT * FROM user_friend WHERE friend_id = " + userId;
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            List<Integer> usersId = new LinkedList<Integer>();
            while (resultSet.next()) {
                if (resultSet.getString(3).equals(Relation.FRIEND.name())) {
                    usersId.add(resultSet.getInt(1));
                }

            }
            return usersId;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void addRequest(long userId, long friendId) {

        try {
            String query = "INSERT INTO user_friend(`user_id`,`friend_id`,`request`) " +
                    "VALUES(?,?,?);";
            PreparedStatement statement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            statement.setLong(1, userId);
            statement.setLong(2, friendId);
            statement.setString(3, Relation.REQUEST.name());
            statement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Integer> allRequestByUserId(long userId) {
        String query = "SELECT * FROM user_friend WHERE friend_id = " + userId;
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            List<Integer> usersId = new LinkedList<Integer>();
            while (resultSet.next()) {
                if (resultSet.getString(3).equals(Relation.REQUEST.name())) {
                    usersId.add(resultSet.getInt(1));
                }
            }
            return usersId;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void removeFriend(long userId, long friendId) {

        try {
            String query = "DELETE FROM user_friend WHERE user_id =" + userId + " AND friend_id =" + friendId;
            Statement statement = connection.createStatement();
            statement.executeUpdate(query);
            removeFriendById(userId, friendId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void removeFriendById(long userId, long friendId) {
        try {
            String query = "DELETE FROM user_friend WHERE user_id =" + friendId + " AND friend_id =" + userId;
            Statement statement = connection.createStatement();
            statement.executeUpdate(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void removeRequest(long userId, long friendId) {

        try {
            String query = "DELETE FROM user_friend WHERE user_id =" + friendId + " AND friend_id =" + userId;
            Statement statement = connection.createStatement();
            statement.executeUpdate(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


}