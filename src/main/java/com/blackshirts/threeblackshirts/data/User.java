package com.blackshirts.threeblackshirts.data;

import java.util.Objects;

public class User {
    private String useremail;
    private String userpassword;
    private boolean cookieUse;

    public User(String useremail, String userpassword) {
        this.useremail = useremail;
        this.userpassword = userpassword;
    }

    @Override
    public String toString() {
        return "User{" +
                "useremail='" + useremail + '\'' +
                ", userpassword='" + userpassword + '\'' +
                '}';
    }

    public String getUseremail() {
        return useremail;
    }

    public void setUseremail(String useremail) {
        this.useremail = useremail;
    }

    public String getUserpassword() {
        return userpassword;
    }

    public void setUserpassword(String userpassword) {
        this.userpassword = userpassword;
    }

    public boolean isUseCookie() {
        return cookieUse;
    }

    public void setUseCookie(boolean cookieUse) {
        this.cookieUse = cookieUse;
    }

//    public boolean matchPassword(String userpw) {
//        if (this.userpassword.equals(userpw))
//            return true;
//        else
//            return false;
//    }


    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        User other = (User) obj;
        if (useremail == null) {
            if (other.useremail != null)
                return false;
        } else if (!useremail.equals(other.useremail))
            return false;
        if (userpassword == null) {
            if (other.userpassword != null)
                return false;
        } else if (!userpassword.equals(other.userpassword))
            return false;
        return true;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((useremail == null) ? 0 : useremail.hashCode());
        result = prime * result + ((userpassword == null) ? 0 : userpassword.hashCode());
        return result;
    }

}
