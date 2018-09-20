/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arkentos.admaster.validation;

/**
 *
 * @author JayanaI
 */
public class Validations {
    public static  String validateRequestData(String category,String subject,String content,String image){
        String response="";
        if(category==null || category.isEmpty()){
            response="Category can not be empty";
        }else if(subject==null || subject.isEmpty()){
            response="Subjecty can not be empty";
        }else if(content==null || content.isEmpty()){
            response="Content can not be empty";
        }else if(image==null || image.isEmpty()){
            response="Image can not be empty";
        }
        System.out.println("validation response "+response);
        return response;
    }
    
}
