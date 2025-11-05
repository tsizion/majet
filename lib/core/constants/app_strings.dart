import 'package:easy_localization/easy_localization.dart';

String get user => "user".tr();

// Validation
String get errorEmailRequired => "error_email_required".tr();
String get errorInvalidEmail => "error_invalid_email".tr();
String get errorPasswordShort => "error_password_short".tr();
String get errorInvalidPhone => "error_invalid_phone".tr();
String get errorPhoneRequired => "error_phone_required".tr();

String get amharic => "Amharic".tr();

String get errorInvalidPhoneNineDigits =>
    "error_invalid_phone_nine_digits".tr();
String errorFieldRequired(String fieldName) =>
    "error_field_required".tr(args: [fieldName]);
String errorDropdownRequired(String fieldName) =>
    "error_dropdown_required".tr(args: [fieldName]);
String get errorDateRequired => "error_date_required".tr();
String errorFileRequired(String fileType) =>
    "error_file_required".tr(args: [fileType]);

String get phoneNumber => "phoneNumber".tr();
String get password => "password".tr();
String get forgotPassword => "forgotPassword".tr();
String get login => "login".tr();
String get doYouHaveAnAccount => "doYouHaveAnAccount".tr();
String get signUp => "signUp".tr();
String get logOut => "logOut".tr();
String get areYouSure => "areYouSure".tr();
String get areYouSureYouWantToCompleteSchedule =>
    "areYouSureYouWantToCompleteSchedule".tr();
String get cancel => "cancel".tr();
String get profile => "profile".tr();
String get whereTo => 'WhereAreYouShippingToday'.tr();
String get tripHistory => 'trip_history'.tr();
String get points => 'points'.tr();
String get settings => 'settings'.tr();
String get moteregnaHistory => 'moteregna_history'.tr();
String get editProfile => 'editProfile'.tr();
String get changeProfilePicture => 'changeProfilePicture'.tr();
String get changePhoneNumber => 'changePhoneNumber'.tr();
String get changeName => 'changeName'.tr();
String get save => 'save'.tr();
String get changePassword => 'change_password'.tr();
String get submit => "submit".tr();
String get enterYourReason => "enterYourReason".tr();
String get message => "message".tr();
String get deleteAccountRequest => "deleteAccountRequest".tr();
String get unexpectedErrorOccured => "unexpectedErrorOccured".tr();
String get somethingWentWrongTryAgain => "somethingWentWrongTryAgain".tr();
String get scheduledRides => "scheduled_rides".tr();

// Create Booking View
String get createNewBooking => "createNewBooking".tr();
String get enterRideDateAndTime => "enterRideDateAndTime".tr();
String get date => "date".tr();
String get time => "time".tr();
String get cargoType => "cargoType".tr();
String get cargoWeightInKg => "cargoWeightInKg".tr();
String get pleaseSelectRideDate => "please_select_ride_date".tr();
String get pleaseSelectRideTime => "please_select_ride_time".tr();
String get pleaseSelectCargoType => "please_select_cargo_type".tr();
String get validationErrorMessage => "validation_error_message".tr();
String get enterPickupLocation => "enterPickupLocation".tr();
String get pickupLocation => "pickupLocation".tr();
String get enterDestinationLocation => "enterDestinationLocation".tr();
String get destinationLocation => "destinationLocation".tr();
String get summary => "summary".tr();
String get rideDate => "rideDate".tr();
String get rideTime => "rideTime".tr();
String get notSet => "not_set".tr();
String get back => "back".tr();
String get next => "next".tr();
String get complete => "complete".tr();
String get confirmBooking => "confirmBooking".tr();
String get bookingConfirmationMessage => "booking_confirmation_message".tr();
String get confirm => "confirm".tr();
String get activeBookings => "active_bookings".tr();
String get completedBookings => "completed_bookings".tr();

// Booking Card Strings
String get rideTo => "ride_to".tr();
String get statusAccepted => "status_accepted".tr();
String get statusRejected => "status_rejected".tr();
String get statusPending => "status_pending".tr();

String get search => "search".tr();
String get language => "language".tr();
String get whyUs => "Why_Choose_Us?".tr();

// -----------
String get aboutUs => 'aboutUs'.tr();
String get welcomeToMoteregna => "welcomeToMoteregna".tr();
String get aboutUsDescription => "aboutUsDescription".tr();
String get whyChooseUs => "whyChooseUs".tr();
String get whyChooseUsDescription => "whyChooseUsDescription".tr();
String get contactUs => "contactUs".tr();
String get emailContact => "emailContact".tr();
String get addressContact => "addressContact".tr();

// change_password_view
String get oldPassword => "oldPassword".tr();
String get enterOldPassword => "enterOldPassword".tr();
String get newPassword => "newPassword".tr();
String get enterNewPassword => "enterNewPassword".tr();
String get confirmNewPassword => "confirmNewPassword".tr();
String get confirmNewPasswordHint => "confirmNewPasswordHint".tr();

// deleted_account_view...done

// password_rest_view
String get resetYourPassword => "resetYourPassword".tr();
String get resetNow => "resetNow".tr();

// forget password
String get forgotPasswordInfo => "forgotPasswordInfo".tr();
String get phoneNumberHint => "phoneNumberHint".tr();
String get continueText => "continue".tr();
// otp view
String get phoneVerification => "phoneVerification".tr();
String get enterOtpInfo => "enterOtpInfo".tr();
String get enterSixDigitCode => "enterSixDigitCode".tr();
String get verify => "verify".tr();
String get didNotGetOtp => "didNotGetOtp".tr();
String get resend => "resend".tr();
// password view
String get enterYourPassword => "enterYourPassword".tr();
String get confirmPassword => "confirmPassword".tr();
String get createAccount => "createAccount".tr();

// signup view
String get enterPhoneNumberForVerification =>
    "enterPhoneNumberForVerification".tr();

String get signIn => "signIn".tr();

// Booking Status texts
String get callingDriver => "callingDriver".tr();
String get seconds => "seconds".tr();
String get estimatedTime => "estimatedTime".tr();
String get contactDriver => "contactDriver".tr();
String get tripCancelled => "tripCancelled".tr();
String get tripCancelledDescription => "tripCancelledDescription".tr();
String get cancelTrip => "cancelTrip".tr();

// General UI text
String get placeholderName => "placeholderName".tr();
String get calculating => "calculating".tr();

// custom reason
String get specifyCancellationReason => "specifyCancellationReason".tr();
String get enterYourReasonHere => "enterYourReasonHere".tr();

// cancel trip dialog
String get pleaseSelectReason => "pleaseSelectReason".tr();
String get driverUnavailable => "driverUnavailable".tr();
String get tripDelayed => "tripDelayed".tr();
String get driverDidNotArrive => "driverDidNotArrive".tr();
String get changedMyMind => "changedMyMind".tr();
String get otherSpecify => "otherSpecify".tr();

// bottom data container
String get noDriversAround => "noDriversAround".tr();
String get retry => "retry".tr();
String get receiverNumber => "receiverNumber".tr();
String get yourDeliveryTime => "yourDeliveryTime".tr();
// booking schedule

String get create => "create".tr();
String get createRideTooltip => "createRideTooltip".tr();
String get noActiveBookings => "noActiveBookings".tr();
String get shipTo => "shipTo".tr();
String get receiverName => "receiverName".tr();
String get receiverNameText => "receiverNameText".tr();

// create booking

String get pleaseEnterReceiverName => "pleaseEnterReceiverName".tr();
String get pleaseEnterCargoWeight => "pleaseEnterCargoWeight".tr();
String get ensureAllFields => "ensureAllFields".tr();

String get deliveryInformation => "deliveryInformation".tr();
String get selectAnItem => "selectAnItem".tr();
String get selectCargoType => "selectCargoType".tr();
String get cargoWeight => "cargoWeight".tr();
String get receiverPhoneNumber => "receiverPhoneNumber".tr();

String get payment => 'payment'.tr();
//  choose
String get journeyCompleted => 'journeyCompleted'.tr();
String get pleaseSelectPayment => 'pleaseSelectPayment'.tr();
String get cash => 'cash'.tr();
String get telebirr => 'telebirr'.tr();
String get birr => 'birr'.tr();

// complaints view
String get complaints => "complaints".tr();
String get sendNewComplaint => "sendNewComplaint".tr();
String get noComplaintsYet => "noComplaintsYet".tr();
String get feedbackInvite => "feedbackInvite".tr();
String get yourComplaints => "yourComplaints".tr();
String get unexpectedError => "unexpectedError".tr();

// HomeView
String get homeView => "homeView".tr();
String get startLocation => "startLocation".tr();
String get yourDestination => "yourDestination".tr();

// make payment
// make_payment_view
String get makePayment => 'makePayment'.tr();
String get journeyCompletedMessage => 'journeyCompletedMessage'.tr();
String get tip => 'tip'.tr();
String get typeTipHint => 'typeTipHint'.tr();
String get pay => 'pay'.tr();
String get transactionHistory => 'transactionHistory'.tr();
String get withdrawPoints => 'withdrawPoints'.tr();

// privacy_policy_view
String get privacyPolicy => 'privacyPolicy'.tr();
String get effectiveDate => 'effectiveDate'.tr();
String get privacyIntro => 'privacyIntro'.tr();
String get informationWeCollect => 'informationWeCollect'.tr();
String get infoDetails => 'infoDetails'.tr();
String get howWeUseInfo => 'howWeUseInfo'.tr();
String get usageDetails => 'usageDetails'.tr();
String get sharingInfo => 'sharingInfo'.tr();
String get sharingDetails => 'sharingDetails'.tr();
String get yourRights => 'yourRights'.tr();
String get rightsDetails => 'rightsDetails'.tr();
String get dataSecurity => 'dataSecurity'.tr();
String get dataSecurityDetails => 'dataSecurityDetails'.tr();
String get contact => 'contact'.tr();
String get contactDetails => 'contactDetails'.tr();
String get profileSuccessMessage => 'profileSuccessMessage'.tr();
String get errorUploadingImage => 'errorUploadingImage'.tr();

// rate_view
String get rateDriver => 'rateDriver'.tr();
String get howDidYouFindJourney => 'howDidYouFindJourney'.tr();
String get pleaseRateExperience => 'pleaseRateExperience'.tr();
String get tapToEditRating => 'tapToEditRating'.tr();

String get rateYourJourney => 'rateYourJourney'.tr();
String get writeYourComment => 'writeYourComment'.tr();
String get done => 'done'.tr();
String get submitRatingSuccess => 'submitRatingSuccess'.tr();
String get submitRatingError => 'submitRatingError'.tr();

String get scheduleDetails => 'scheduleDetails'.tr();
String get rideDetails => 'rideDetails'.tr();
// String get date => 'date'.tr();
// String get time => 'time'.tr();
// String get pickupLocation => 'pickupLocation'.tr();
String get destination => 'destination'.tr();
String get itemType => 'itemType'.tr();
String get receiversName => 'receiversName'.tr();
String get receiversPhoneNumber => 'receiversPhoneNumber'.tr();
String get itemWeight => 'itemWeight'.tr();
String get status => 'status'.tr();
String get editDateAndTime => 'editDateAndTime'.tr();
String get saveChanges => 'saveChanges'.tr();
String get saving => 'saving'.tr();
String get cancelRide => 'cancelRide'.tr();
String get cancelling => 'cancelling'.tr();
String get unknownLocation => 'unknownLocation'.tr();
String get unknownItem => 'unknownItem'.tr();
String get unknownReceiver => 'unknownReceiver'.tr();
String get unknownReceiverPhoneNumber => 'unknownReceiverPhoneNumber'.tr();
String get unknownWeight => 'unknownWeight'.tr();
String get recentSearch => 'recentSearc'.tr();
String get useCurrentLocation => 'useCurrentLocation'.tr();

// search view_modal
String get emptyPickupAndDestination => 'emptyPickupAndDestination'.tr();
String get errorGettingCurrentLocation => 'errorGettingCurrentLocation'.tr();
String get currentLocation => 'currentLocation'.tr();
String get errorGettingDestinationLocation =>
    'errorGettingDestinationLocation'.tr();

String get complaint => 'complaint'.tr();
String get deleteAccount => 'deleteAccount'.tr();
String get logout => 'logout'.tr();
String get accountNotSetup => 'accountNotSetup'.tr();
String get setupNow => 'setupNow'.tr();
String get telebirrCheckout => 'telebirrCheckout'.tr();
String get noPaymentUrl => 'noPaymentUrl'.tr();
String get withdrawalHistory => 'withdrawalHistory'.tr();
String get noWithdrawalHistory => 'noWithdrawalHistory'.tr();
String get withdrew => 'withdrew'.tr();
String get loadingTripHistory => 'loadingTripHistory'.tr();
String get noRecentTrips => 'noRecentTrips'.tr();
String get noTripsCompleted => 'noTripsCompleted'.tr();
String get completed => 'completed'.tr();
String get fullName => 'fullName'.tr();
String get profileImage => 'profileImage'.tr();
String get completeYourInformation => 'completeYourInformation'.tr();
String get yourPoint => 'yourPoint'.tr();
String get ye => 'ye'.tr();
String get moteregna => 'moteregna'.tr();
String get history => 'history'.tr();

// withdraw viewModal
String get accountNumber => 'accountNumber'.tr();
String get accountNumberValidation => 'accountNumberValidation'.tr();
String get accountHolderName => 'accountHolderName'.tr();
String get accountHolderNameValidation => 'accountHolderNameValidation'.tr();
String get amount => 'amount'.tr();
String get amountInvalid => 'amountInvalid'.tr();
String get amountTooLow => 'amountTooLow'.tr();
String get invalidPhoneNumber => 'invalidPhoneNumber'.tr();
String get pleaseFillFormCorrectly => 'pleaseFillFormCorrectly'.tr();
String get unknownError => 'unknownError'.tr();
String get errorPrefix => 'errorPrefix'.tr();

// withdrawal view
String get withdrawalFormTitle => 'withdrawalFormTitle'.tr();
String get withdrawalDetails => 'withdrawalDetails'.tr();
String get accountNumberLabel => 'accountNumberLabel'.tr();
String get phoneNumberLabel => 'phoneNumberLabel'.tr();
String get accountNumberHint => 'accountNumberHint'.tr();
String get accountHolderNameLabel => 'accountHolderNameLabel'.tr();
String get accountHolderNameHint => 'accountHolderNameHint'.tr();
String get amountLabel => 'amountLabel'.tr();
String get submitWithdrawal => 'submitWithdrawal'.tr();
String get noWithdrawalOption => 'noWithdrawalOption'.tr();
String get withdrawalOption => 'withdrawalOption'.tr();
String get readMore => 'Read More'.tr();
String get more => 'more'.tr();
String get schedule => 'schedule'.tr();
String get home => 'home'.tr();

String get reviewDescription => 'Review Description'.tr();
String get close => 'close'.tr();
String get finalPrice => 'finalPrice'.tr();
String get locationRequired => 'locationRequired'.tr();
String get turnOnDeviceLocation => 'turnOnDeviceLocation'.tr();
String get turnOnLocation => 'turnOnLocation'.tr();
// String get exit => 'exit'.tr();

// cargo and receiver info
String get document => 'document'.tr();
String get parcel => 'parcel'.tr();
String get electronics => 'electronics'.tr();
String get fragile => 'fragile'.tr();
String get other => 'other'.tr();
