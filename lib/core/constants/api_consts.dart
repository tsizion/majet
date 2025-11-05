const String domainBaseUrl = 'https://moteregnatransport.com/backend';

const String baseUrl = 'https://moteregna-api-0w6c.onrender.com/api/v1';
// const String baseUrl = 'https://moteregnatransport.com/backend/api/v1';
const String getOrCreateUser = '/user/get-or-create';
const String loginTokenUrl = '/user/loginToken';
const String userSingUpUrl = '/user/';
const String loginUrl = '/user/login';
const String rideUrl = '/ride';
const String checkPaymentStatusUrl = '/appUpdate/';

//
// const String socketUrl = "https://socket.moteregnatransport.com";
const String socketUrl = "https://moteregna-socket.onrender.com";

const String withdrawalOptionsUrl = '/banks/';

const String teleBirrWebCheckoutUrl = '/ride/tellebirrcheckout';

const String rideDetailUrl = '/ride/';
const String rideSettingsUrl = '/bonus/';
const String ratingReviewUrl = '/review/';

const String payInCashUrl = '/ride/paidInCash/';
const String payWithChapa = '/ride/chappa/';

const String socketRideUrl = '/api/v1/ride';
// const String socketRideUrl = '/ride';
const String vehicleTypes = '/setting/car-type/';
const String rideStatus = "/ride/status/";
const String getDriver = '/driver/';
const String checkOnTripUrl = '/ride/user/active-ride/';
const String cancelTripUrl = '/ride/cancel/';
const String updateUserUrl = "/user/";
const String tripHistoryUrl = "/ride/user/history/";

//end points for NFC Tag
const String createTagUrl = '/nfc';
const String getAllTagsUrl = '/nfc/my/nfc';
const String startTripUrl = '/ride/start/';
const String getNfcProfileUrl = '/nfcuser/';
const String getFriendsListUrl = '/nfcuser/';
const String saveNfcProfileUrl = '/nfcuser/edit-profile';

// end points for user bonus
const String updateUserBonusUrl = '/user/addbonus/';
const String getUserBonusUrl = '/user/balance/coin';

// end points for donation and withdrawals
const String donateUrl = '/donation/user';
const String getDonationOrganizationUrl = '/charity';
const String submitWithdrawUrl = '/withdraw/user/';

// complaint end points
const String postComplaintUrl = '/compliance';
const String getComplaintUrl = '/compliance/';

// otp end point
const String sendOtpUrl = '/user/send-otp';
const String verifyOtpUrl = '/user/verify-otp';

//Scheduled trip booking
const String scheduledTripUrl = '/booking';

//sos
const String sosUrl = '/sos/alert/';

//get image url
const getImage = '/user/get-images/';

//
const String checkUserRegisteredUrl = '/user/phoneChecker';

//driver

// Base URL for the API
// const String baseUrl = 'https://mood-ride-api.onrender.com/api/v1';

// Driver-related URLs

const String registerUserUrl = '/user/register';
const String checkDriverByPhoneNumberUrl = '/user/phoneChecker';
const String checkDriverRegisteredUrl = '/user/phoneChecker';
const String resetPasswordUrl = '/user/passwordReset/';
const String passwordChangeUrl = '/user/passwordChange/';

// Ride-related URLs
const String finalPriceUrl = '/ride/final-price';
const String completeRideUrl = '/ride/complete/';
const String startTripWithPhoneNumberUrl = '/ride/driver-create/';

// Review & Rating URLs
const String ratePassengerUrl = '/review/';

// Wallet URLs
const String getWalletUrl = "/wallet/my-wallet/";

// Badge-related URLs
const String recentlyAwardedDriversUrl = "/badge/recent/badges/";
// const String recentlyAwardedDriversUrl = "/setting/badge/";

const String uploadProfileImageUrl = "/user/upload/";
