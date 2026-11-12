/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */



 package model;

public class User {

    private int id;
    private String name;
    private String email;
    private String password;
    private String city;
    private String bio;
    private String skills;
private String learning;
private String certifications;
private String certificateTitle;
private String certificateIssuer;
private String certificateDescription;
private String certificateFile;

    public User() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }
    public String getSkills() {
    return skills;
}

public void setSkills(String skills) {
    this.skills = skills;
}

public String getLearning() {
    return learning;
}

public void setLearning(String learning) {
    this.learning = learning;
}

public String getCertifications() {
    return certifications;
}

public void setCertifications(String certifications) {
    this.certifications = certifications;
}
public String getCertificateTitle() {
    return certificateTitle;
}

public void setCertificateTitle(String certificateTitle) {
    this.certificateTitle = certificateTitle;
}

public String getCertificateIssuer() {
    return certificateIssuer;
}

public void setCertificateIssuer(String certificateIssuer) {
    this.certificateIssuer = certificateIssuer;
}

public String getCertificateDescription() {
    return certificateDescription;
}

public void setCertificateDescription(String certificateDescription) {
    this.certificateDescription = certificateDescription;
}

public String getCertificateFile() {
    return certificateFile;
}

public void setCertificateFile(String certificateFile) {
    this.certificateFile = certificateFile;
}
}