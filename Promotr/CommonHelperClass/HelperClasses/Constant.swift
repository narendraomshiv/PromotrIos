//
//  Constant.swift
//  Shamsaha
//
//  Created by Narendra Kumar on 06/02/23.
//

import Foundation

let BaseUrl = "https://api.promotr.club/api/v1/"
let publicUrl = "https://api.promotr.club/api/v1/public/"
let image_url = "https://api.promotr.club/storage/"
let imageBaseURL = "https://api.promotr.club/storage/"
var login_url = BaseUrl+"auth/login"
var sign_up = BaseUrl+"auth/register?locale=en"
var verify_Otp = BaseUrl+"auth/otp-verifications"
var forgot_password = BaseUrl+"auth/forgot-password?locale=en"
var resendOTP = BaseUrl+"auth/otps"
var Slider_url = publicUrl+"app-sliders"
var Category_url = BaseUrl+"categories"
var promoCodeOftheDay_url = BaseUrl+"promo-codes/of-the-day"
var country_code = "https://cuik-projects.github.io/country-list/countries.json"
var cetogeryPromocode = BaseUrl
var promoCodeDetailsPage = BaseUrl+"promo-codes/"
var promoCodeBySearchFilter = BaseUrl+"promo-codes?"
var userProfile = BaseUrl+"protected/user-profile"
var favorite = BaseUrl+"protected/user-promo-codes"
//======Become - Promoter
var become_a_promoter = "https://api.promotr.club/api/v1/protected/user-profile/become-a-promoter"
var Create_PromoCode = BaseUrl+"protected/promo-codes"


//========================================================

struct Constant {
    static let PROGRESS_TITLE = "Loading..."
    static let ISSUE = "Something went wrong"
    static let SERVER_ISSUE = "Server not responding"
    static let MESSAGE_NETWORK = "Please check network connection"
    static let TITLE = "Promotr"
    static let BLANK = ""
    static let SPACE = " "
    static let ZERO = 0
    static let SUCCESS = "True"
    static let MSG_LOGOUT = "Are you sure you want to logout."
    static let LOGOUT = "Logout"
    static let CURRENCY = "FCFA"
    static let EMAIL_ENTER = "Please enter email."
    static let EMAIL_VALIDATION = "Please enter valid email."
    static let FRIST_NAME = "Please enter frist name."
    static let LAST_NAME = "Please enter last name."
    static let ENTER_DOB = "Please enter Date of Birth."
    static let ENTER_ADDRESS = "Please enter address."
    static let SELECT_GENDER = "Please select gender."
    static let ENTER_PHONE_NUMBER = "Please enter phone number."
    static let PHONE_NUMBER_VALIDATION = "Please enter valid phone number must have in between 7 to 15 number."
    static let PASSWORD_VALIDATION = "Please enter valid Password must have in between 8 to 15 characters , Password contain 1 special character , 1 digit , 1 uppercase letter. 1 lowwercase letter."
    static let SELECT_COUNTRY = "Please Select your country"
    static let SELECT_COUNTRYCODE = "Please Select your country Code"
    static let PASSWORD_NOT_MATCH = "New password doesn't match with confirm password."
    static let ENTER_OLD_PASSWORD = "Please enter old password."
    static let ENTER_NEW_PASSWORD = "Please enter new password."
    static let ENTER_CONFIRM_PASSWORD = "Please enter confirm password."
    static let VALID_EMAIL = "The email must be a valid email address."
    static let ASK_LOGIN = "Please Frist Login To Access your Profile"
    static let PLS_LOGIN = "Please Login"
    
    static let About = "The about must be at least 50 characters"
    static let INSTAGRAM_LINK = "Please fill instagramLink section!"
    static let Image_Url  = "Please Upload Image!"
    static let All_FIELD  = "Please Fill all the field"
}
