import 'dart:io';
import "package:collection/collection.dart";
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:my_doc_lab/core/connect_end/model/add_med_entity_model/add_med_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/get_pharm_order_model/get_pharm_order_model.dart';
import 'package:my_doc_lab/core/connect_end/model/get_pharm_wallet_response_model/get_pharm_wallet_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/get_pharmacy_detail_response_model/get_pharmacy_detail_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/post_user_cloud_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/update_pharm_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/repo/pharm_repo_impl.dart';
import 'package:my_doc_lab/core/core_folder/app/app.router.dart';
import 'package:stacked/stacked.dart';
import '../../../main.dart';
import '../../../ui/app_assets/app_color.dart';
import '../../../ui/app_assets/app_image.dart';
import '../../../ui/app_assets/app_utils.dart';
import '../../../ui/app_assets/app_validatiion.dart';
import '../../../ui/app_assets/image_picker.dart';
import '../../../ui/widget/text_form_widget.dart';
import '../../../ui/widget/text_widget.dart';
import '../../core_folder/app/app.logger.dart';
import '../model/get_med_by_id_response_model/get_med_by_id_response_model.dart';
import '../model/get_pharm_med_response_model/get_pharm_med_response_model.dart';
import '../model/get_pharmacy_categories/get_pharmacy_categories.dart';
import '../model/order_by_id_response_model/order_by_id_response_model.dart';
import '../model/post_user_verification_cloud_response/post_user_verification_cloud_response.dart';
import 'package:my_doc_lab/core/connect_end/model/get_pharm_order_model/get_pharm_order_model.dart'
    as item;

class PharmViewModel extends BaseViewModel {
  final BuildContext? context;
  final logger = getLogger('PharmViewModel');

  final repositoryImply = PharmRepoImpl();

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _isLoadingDelCat = false;
  bool get isLoadingDelCat => _isLoadingDelCat;
  bool _isLoadingDelMeds = false;
  bool get isLoadingDelMeds => _isLoadingDelMeds;
  bool _isLoadingPharmMed = false;
  bool get isLoadingPharmMed => _isLoadingPharmMed;

  String pharmMedQuery = '';
  String pharmMedQueryOrder = '';
  String tab = 'All';

  PharmViewModel({this.context});

  GetPharmacyDetailResponseModel? _getPharmacyDetailResponseModel;
  GetPharmacyDetailResponseModel? get getPharmacyDetailResponseModel =>
      _getPharmacyDetailResponseModel;

  PostUserVerificationCloudResponse? _postUserVerificationCloudResponse;
  PostUserVerificationCloudResponse? get postUserVerificationCloudResponse =>
      _postUserVerificationCloudResponse;
  final _pickImage = ImagePickerHandler();
  File? image;
  String? filename;
  GetPharmacyCategoriesList? _getPharmacyCategoriesList;
  GetPharmacyCategoriesList? get getPharmacyCategoriesList =>
      _getPharmacyCategoriesList;
  GetPharmMedResponseModelList? _getPharmMedResponseModelList;
  GetPharmMedResponseModelList? get getPharmMedResponseModelList =>
      _getPharmMedResponseModelList;

  TextEditingController addPharmCategoriesTextController =
      TextEditingController();
  TextEditingController productNameTextController = TextEditingController();
  TextEditingController productPriceTextController = TextEditingController();
  TextEditingController productCategoryTextController = TextEditingController();
  TextEditingController productVolumnTextController = TextEditingController();
  TextEditingController productQuantityTextController = TextEditingController();
  TextEditingController productTextController = TextEditingController();

  OrderByIdResponseModel? _orderByIdResponseModel;
  OrderByIdResponseModel? get orderByIdResponseModel => _orderByIdResponseModel;

  GetPharmacyCategories? pharmacyCategoriesInfo;
  GetMedByIdResponseModel? _getMedByIdResponseModel;
  GetMedByIdResponseModel? get getMedByIdResponseModel =>
      _getMedByIdResponseModel;
  GetPharmacyCategories? _getCategoryByIdResponseModel;
  GetPharmacyCategories? get getCategoryByIdResponseModel =>
      _getCategoryByIdResponseModel;

  GetPharmOrderModel? _getPharmOrderModel;
  GetPharmOrderModel? get getPharmOrderModel => _getPharmOrderModel;

  GetPharmWalletResponseModel? _getPharmWalletResponseModel;
  GetPharmWalletResponseModel? get getPharmWalletResponseModel =>
      _getPharmWalletResponseModel;

  bool selectStatus = false;

  String productExpiryDate = '';
  bool onEditCate = false;
  GetPharmacyCategories? onEditGetPharmacyCategories;
  GlobalKey<FormState> proFormKey = GlobalKey<FormState>();

  List<item.Items> orderItemListInProgress = [];
  List<item.Items> orderItemListCancelled = [];
  List<item.Items> orderItemListCompleted = [];

  pickDateExpProduct(context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy/MM/dd').format(pickedDate);
      productExpiryDate = formattedDate;
    } else {}
    notifyListeners();
  }

  loadingDialog(context) => showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: TextView(
          text: 'Please wait..',
          textAlign: TextAlign.center,
          textStyle: GoogleFonts.gabarito(
            color: AppColor.primary1,

            fontSize: 20.2.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              SpinKitPouringHourGlassRefined(
                color: AppColor.primary1,
                size: 50.sp,
              ),
              SizedBox(height: 40.h),
              TextView(
                text: 'Loading...!',
                textStyle: GoogleFonts.gabarito(
                  color: AppColor.primary1,
                  fontSize: 17.2.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );

  medCategoryDialog(context) => showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: TextView(
          text: 'All Categories',
          textAlign: TextAlign.center,
          textStyle: GoogleFonts.gabarito(
            color: const Color.fromARGB(255, 48, 74, 62),

            fontSize: 20.2.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        content: ViewModelBuilder<PharmViewModel>.reactive(
          viewModelBuilder: () => PharmViewModel(),
          onViewModelReady: (model) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              model.getPharmCategories();
            });
          },
          disposeViewModel: false,
          builder: (_, PharmViewModel model, __) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  if (model.isLoading)
                    Padding(
                      padding: EdgeInsets.only(top: 10.w),
                      child: Center(
                        child: SpinKitCircle(
                          color: AppColor.primary1,
                          size: 34.sp,
                        ),
                      ),
                    ),
                  if (model.getPharmacyCategoriesList != null &&
                      model
                          .getPharmacyCategoriesList!
                          .getPharmacyCategoriesList!
                          .isNotEmpty)
                    ...model
                        .getPharmacyCategoriesList!
                        .getPharmacyCategoriesList!
                        .map(
                          (o) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  productCategoryTextController.text =
                                      o.name ?? '';
                                  pharmacyCategoriesInfo = o;

                                  Navigator.pop(context);
                                  notifyListeners();
                                },
                                child: Container(
                                  width: double.infinity,
                                  child: TextView(
                                    text: o.name ?? '',
                                    textStyle: GoogleFonts.gabarito(
                                      color: AppColor.black,
                                      fontSize: 16.2.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              Divider(
                                color: const Color.fromARGB(255, 48, 74, 62),
                                thickness: 1,
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            );
          },
        ),
      );
    },
  );

  formartFileImage(File? imageFile) {
    if (imageFile == null) return;
    return File(imageFile.path.replaceAll('\'', '').replaceAll('File: ', ''));
  }

  void pickImage(BuildContext context) {
    try {
      _pickImage.pickImage(
        context: context,
        file: (file) {
          image = file;
          filename = image!.path.split("/").last;
          postToCloudinary(
            context,
            postCloudinary: PostUserCloudEntityModel(
              file: MultipartFile.fromBytes(
                formartFileImage(image).readAsBytesSync(),
                filename: image!.path.split("/").last,
              ),
              uploadPreset: 'profilePicture',
              apiKey: '229558523244366',
            ),
          );
          notifyListeners();
        },
      );
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> postToCloudinary(
    context, {
    PostUserCloudEntityModel? postCloudinary,
  }) async {
    try {
      loadingDialog(context);
      _postUserVerificationCloudResponse = await runBusyFuture(
        repositoryImply.postCloudinary(postCloudinary!),
        throwException: true,
      );
      if (_postUserVerificationCloudResponse != null) {
        Navigator.pop(context);
        AppUtils.snackbar(
          context,
          message: 'Image uploaded to cloudinary Sucessfully.!',
        );
      }
    } catch (e) {
      Navigator.pop(context);
      AppUtils.snackbar(
        context,
        message: 'Please try again later.',
        error: true,
      );
    }
    notifyListeners();
  }

  Future<void> getPharmacistDetail(context) async {
    try {
      _isLoading = true;
      _getPharmacyDetailResponseModel = await runBusyFuture(
        repositoryImply.getPharmacyDetails(),
        throwException: true,
      );

      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      // AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void updatePharmDetail(
    context, {
    UpdatePharmEntityModel? update,
    String? id,
  }) async {
    try {
      loadingDialog(context);
      var v = await runBusyFuture(
        repositoryImply.updatePharmacy(id!, updatePharm: update),
        throwException: true,
      );
      if (v['message'] == 'Account updated successfully!') {
        Navigator.pop(context);
        AppUtils.snackbar(context, message: v['message']);
        navigate.navigateTo(Routes.pharmacyDashboard);
      }
    } catch (e) {
      Navigator.pop(context);
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getPharmCategories() async {
    try {
      _isLoading = true;
      _getPharmacyCategoriesList = await runBusyFuture(
        repositoryImply.getPharmacyCategories(),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      logger.d(e);
      _isLoading = false;
    }
    notifyListeners();
  }

  void getPharmMedicine() async {
    try {
      _getPharmMedResponseModelList = await runBusyFuture(
        repositoryImply.getAllMedsList(),
        throwException: true,
      );
    } catch (e) {
      logger.d(e);
    }
    notifyListeners();
  }

  Future<void> getPharmOrder() async {
    try {
      _isLoading = true;
      _getPharmOrderModel = await runBusyFuture(
        repositoryImply.pharmOrder(),
        throwException: true,
      );
      List<item.Items> orderItemList = [];
      for (var element in _getPharmOrderModel!.original!.orders!) {
        orderItemList.addAll(element.items!);
        notifyListeners();
      }

      groupBy(orderItemList, (item.Items o) {
        if (o.status?.toLowerCase() == 'cancelled') {
          orderItemListCancelled.add(o);
          notifyListeners();
        }
      });
      groupBy(orderItemList, (item.Items o) {
        if (o.status?.toLowerCase() == 'completed') {
          orderItemListCompleted.add(o);
          notifyListeners();
        }
      });
      groupBy(orderItemList, (item.Items o) {
        if (o.status?.toLowerCase() == 'processed') {
          orderItemListInProgress.add(o);
          notifyListeners();
        }
      });
      _isLoading = false;
    } catch (e) {
      logger.d(e);
      _isLoading = false;
    }
    notifyListeners();
  }

  searchStatusItem(search) {
    notifyListeners();
  }

  onTapStatusContainer() => Container(
    decoration: BoxDecoration(
      // ignore: deprecated_member_use
      color: AppColor.primary1.withOpacity(.08),
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: AppColor.greylight),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            tab = 'All';
            notifyListeners();
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 10.w),
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: tab == 'All' ? AppColor.primary1 : AppColor.transparent,

              borderRadius: BorderRadius.circular(10),
            ),
            child: TextView(
              text: 'All',
              textStyle: GoogleFonts.dmSans(
                color: tab == 'All' ? AppColor.white : AppColor.primary1,
                fontSize: 13.0.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            tab = 'In progress';
            pharmMedQueryOrder = '';
            notifyListeners();
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 10.w),
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color:
                  tab == 'In progress'
                      ? AppColor.primary1
                      : AppColor.transparent,

              borderRadius: BorderRadius.circular(10),
            ),
            child: TextView(
              text: 'In progress',
              textStyle: GoogleFonts.dmSans(
                color:
                    tab == 'In progress' ? AppColor.white : AppColor.primary1,
                fontSize: 13.0.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            tab = 'Failed';
            pharmMedQueryOrder = '';
            notifyListeners();
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 10.w),
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: tab == 'Failed' ? AppColor.primary1 : AppColor.transparent,

              borderRadius: BorderRadius.circular(10),
            ),
            child: TextView(
              text: 'Failed',
              textStyle: GoogleFonts.gabarito(
                color: tab == 'Failed' ? AppColor.white : AppColor.primary1,
                fontSize: 13.0.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            tab = 'Completed';
            pharmMedQueryOrder = '';
            notifyListeners();
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 10.w),
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color:
                  tab == 'Completed' ? AppColor.primary1 : AppColor.transparent,

              borderRadius: BorderRadius.circular(10),
            ),
            child: TextView(
              text: 'Completed',
              textStyle: GoogleFonts.gabarito(
                color: tab == 'Completed' ? AppColor.white : AppColor.primary1,
                fontSize: 13.0.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    ),
  );

  getPharmOrderId(id) async {
    try {
      _isLoading = true;
      _orderByIdResponseModel = await runBusyFuture(
        repositoryImply.pharmOrderId(id),
        throwException: true,
      );

      _isLoading = false;
    } catch (e) {
      logger.d(e);
      _isLoading = false;
    }
    // notifyListeners();
  }

  void getPharmWallet() async {
    try {
      _isLoading = true;
      _getPharmWalletResponseModel = await runBusyFuture(
        repositoryImply.pharmWallet(),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
    }
    notifyListeners();
  }

  Future<void> getPharmMedicineByID(id) async {
    try {
      _getMedByIdResponseModel = await runBusyFuture(
        repositoryImply.getMedicineById(id),
        throwException: true,
      );
    } catch (e) {
      logger.d(e);
    }
    notifyListeners();
  }

  Future<void> getPharmCategoryByID(id) async {
    try {
      _getCategoryByIdResponseModel = await runBusyFuture(
        repositoryImply.getCategoryById(id),
        throwException: true,
      );
      pharmacyCategoriesInfo = _getCategoryByIdResponseModel;
    } catch (e) {
      logger.d(e);
    }
    notifyListeners();
  }

  void addPharmCategories(String name) async {
    try {
      _isLoading = true;
      await runBusyFuture(
        repositoryImply.addPharmCategories(name),
        throwException: true,
      );
      await getPharmCategories();
      addPharmCategoriesTextController.clear();
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
    }
    notifyListeners();
  }

  Future<void> addPharmMedicine({context, AddMedEntityModel? add}) async {
    try {
      _isLoadingPharmMed = true;
      var v = await runBusyFuture(
        repositoryImply.addPharmMedicine(add!),
        throwException: true,
      );
      _isLoadingPharmMed = false;
      Navigator.pop(context);
      AppUtils.snackbarTop(context, message: '${v['message']}');
    } catch (e) {
      _isLoadingPharmMed = false;
      logger.d(e);
    }
    notifyListeners();
  }

  Future<void> updatePharmMedicine({
    context,
    String? id,
    AddMedEntityModel? add,
  }) async {
    try {
      _isLoadingPharmMed = true;
      var v = await runBusyFuture(
        repositoryImply.updatePharmMedicine(id: id, add: add),
        throwException: true,
      );
      _isLoadingPharmMed = false;
      Navigator.pop(context);
      AppUtils.snackbarTop(context, message: '${v['message']}');
    } catch (e) {
      _isLoadingPharmMed = false;
      logger.d(e);
    }
    notifyListeners();
  }

  void updatePharmCategories({String? name, String? id}) async {
    try {
      _isLoading = true;
      await runBusyFuture(
        repositoryImply.updatePharmCategories(name: name, id: id),
        throwException: true,
      );
      getPharmCategories();
      addPharmCategoriesTextController.clear();
      onEditCate = false;

      notifyListeners();
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
    }
    notifyListeners();
  }

  void updatePharmMedsQty({String? quabtity, String? id}) async {
    try {
      await runBusyFuture(
        repositoryImply.updatePharmMedsQty(quantity: quabtity, id: id),
        throwException: true,
      );
    } catch (e) {
      logger.d(e);
    }
    notifyListeners();
  }

  Future<void> deletePharmCategories(context, {String? id}) async {
    try {
      _isLoadingDelCat = true;
      await runBusyFuture(
        repositoryImply.deletePharmCategories(id!),
        throwException: true,
      );
      Navigator.pop(context);
      _isLoadingDelCat = false;
    } catch (e) {
      _isLoadingDelCat = false;
      logger.d(e);
    }
    notifyListeners();
  }

  Future<void> deletePharmMed(context, {String? id}) async {
    try {
      _isLoadingDelMeds = true;
      await runBusyFuture(
        repositoryImply.deletePharmMed(id!),
        throwException: true,
      );
      Navigator.pop(context);
      _isLoadingDelMeds = false;
    } catch (e) {
      _isLoadingDelMeds = false;
      logger.d(e);
    }
    notifyListeners();
  }

  void modalBottomSheetAddMedicine(context, {bool update = false, String? id}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Enables full-screen dragging
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (builder) {
        final isTablet = MediaQuery.of(context).size.shortestSide >= 600;
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: DraggableScrollableSheet(
                expand: false,
                initialChildSize: 0.7, // 50% of screen height
                minChildSize: 0.5, // Can be dragged to 30% of screen height
                maxChildSize: 0.9, // Can be dragged to 90% of screen height
                builder: (context, scrollController) {
                  return ViewModelBuilder<PharmViewModel>.reactive(
                    viewModelBuilder: () => PharmViewModel(),
                    onViewModelReady: (model) {
                      WidgetsBinding.instance.addPostFrameCallback((_) async {
                        model.getPharmCategories();
                        model.getPharmacistDetail(context);
                        if (update == true) {
                          await model.getPharmMedicineByID(id);
                          await model.getPharmCategoryByID(
                            model.getMedByIdResponseModel?.medicineCategoryId
                                ?.toString(),
                          );
                          pharmacyCategoriesInfo =
                              model.getCategoryByIdResponseModel;

                          productCategoryTextController.text =
                              model.getCategoryByIdResponseModel?.name ?? '';
                          productNameTextController.text =
                              model.getMedByIdResponseModel?.name ?? '';
                          productPriceTextController.text =
                              model.getMedByIdResponseModel?.price.toString() ??
                              '';

                          productVolumnTextController.text =
                              model.getMedByIdResponseModel?.volume ?? '';
                          productQuantityTextController.text =
                              model.getMedByIdResponseModel?.quantity
                                  .toString() ??
                              '';
                          productTextController.text =
                              model.getMedByIdResponseModel?.details ?? '';
                          model.productExpiryDate =
                              model.getMedByIdResponseModel?.expirationDate ??
                              '';
                          model.getMedByIdResponseModel?.status
                                      ?.toLowerCase() ==
                                  'active'
                              ? selectStatus = true
                              : false;

                          model.notifyListeners();
                        }
                      });
                    },
                    disposeViewModel: false,
                    onDispose: (viewModel) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        clearPharmProductController();
                      });
                    },
                    builder: (_, PharmViewModel model, __) {
                      return SingleChildScrollView(
                        padding: EdgeInsets.only(left: 12.w, right: 24.w),
                        controller: scrollController,
                        child: Form(
                          key: proFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 6.0.h),
                              Center(
                                child: Container(
                                  width: 30.w,
                                  height: 3.5.h,
                                  margin: EdgeInsets.only(top: 10.w),
                                  decoration: BoxDecoration(
                                    color: AppColor.grey2.withOpacity(.4),
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16.0.h),
                              TextView(
                                text:
                                    id == null
                                        ? 'Add New Product'
                                        : 'Update Product',
                                textStyle: TextStyle(
                                  color: AppColor.black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 20.h),
                              TextFormWidget(
                                label: 'Product Name',
                                labelStyle: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.primary1,
                                ),
                                border: 10,
                                isFilled: true,
                                fillColor: AppColor.white,
                                controller: productNameTextController,
                                validator: AppValidator.validateString(),
                              ),
                              SizedBox(height: 20.h),
                              TextFormWidget(
                                label: 'Price (₦)',
                                labelStyle: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.primary1,
                                ),
                                border: 10,
                                isFilled: true,
                                fillColor: AppColor.white,
                                controller: productPriceTextController,
                                validator: AppValidator.validateInt(),
                              ),
                              SizedBox(height: 20.h),
                              TextFormWidget(
                                label: 'Volume',
                                labelStyle: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.primary1,
                                ),
                                border: 10,
                                isFilled: true,
                                fillColor: AppColor.white,
                                controller: productVolumnTextController,
                                validator: AppValidator.validateString(),
                              ),
                              SizedBox(height: 20.h),
                              TextFormWidget(
                                label: 'Quantity',
                                labelStyle: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.primary1,
                                ),
                                border: 10,
                                isFilled: true,
                                fillColor: AppColor.white,
                                controller: productQuantityTextController,
                                keyboardType: TextInputType.number,
                                validator: AppValidator.validateInt(),
                              ),
                              SizedBox(height: 20.h),
                              TextFormWidget(
                                label: 'Description',
                                maxline: 5,
                                labelStyle: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.primary1,
                                ),
                                border: 10,
                                isFilled: true,
                                alignLabelWithHint: true,
                                fillColor: AppColor.white,
                                controller: productTextController,
                                validator: AppValidator.validateString(),
                              ),
                              SizedBox(height: 20.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      model.pickDateExpProduct(context);
                                      notifyListeners();
                                      setState(() {});
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 8.w,
                                        horizontal: 14.w,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: AppColor.darkindgrey,
                                        ),
                                      ),
                                      child: TextView(
                                        text:
                                            model.productExpiryDate != ''
                                                ? model.productExpiryDate
                                                : "Select Exp Date",
                                        textStyle: TextStyle(
                                          color: AppColor.black,
                                          fontSize: 14.80.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    child: Row(
                                      children: [
                                        TextView(
                                          text: 'Status',
                                          textStyle: TextStyle(
                                            color: AppColor.black,
                                            fontSize: 16.80.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),

                                        Checkbox(
                                          value: selectStatus,
                                          onChanged: (isChecked) {
                                            setState(() {
                                              if (isChecked!) {
                                                selectStatus = true;
                                              } else {
                                                selectStatus = false;
                                              }
                                            });
                                            notifyListeners();
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.h),
                              TextFormWidget(
                                label: 'Medicine Category',
                                labelStyle: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.primary1,
                                ),
                                border: 10,
                                isFilled: true,
                                readOnly: true,
                                fillColor: AppColor.white,
                                controller: productCategoryTextController,
                                validator: AppValidator.validateString(),
                                suffixWidget: Padding(
                                  padding: EdgeInsets.all(9.2.w),
                                  child: GestureDetector(
                                    onTap:
                                        update == true
                                            ? () {}
                                            : () => medCategoryDialog(context),
                                    child: Icon(
                                      Icons.arrow_drop_down,
                                      size: 20.sp,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 50.h),
                              model.isLoadingPharmMed
                                  ? SpinKitCircle(
                                    color: AppColor.primary1,
                                    size: 34.sp,
                                  )
                                  : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () => Navigator.pop(context),
                                        child: Container(
                                          padding:
                                              isTablet
                                                  ? EdgeInsets.all(12.0.w)
                                                  : EdgeInsets.all(20.0.w),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),

                                            color: const Color.fromARGB(
                                              255,
                                              208,
                                              234,
                                              222,
                                            ),
                                          ),
                                          width: 140.w,
                                          alignment: Alignment.center,
                                          child: TextView(
                                            text: 'Cancel',
                                            textStyle: GoogleFonts.gabarito(
                                              color: AppColor.primary1,
                                              fontSize: 18.0.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          if (proFormKey.currentState!
                                                  .validate() &&
                                              model.productExpiryDate != '') {
                                            if (update == true) {
                                              await model.updatePharmMedicine(
                                                context: context,
                                                id: id,
                                                add: AddMedEntityModel(
                                                  name:
                                                      productNameTextController
                                                          .text
                                                          .trim(),
                                                  volume:
                                                      productVolumnTextController
                                                          .text
                                                          .trim(),
                                                  details:
                                                      productTextController.text
                                                          .trim(),
                                                  quantity: int.parse(
                                                    productQuantityTextController
                                                        .text
                                                        .trim(),
                                                  ),
                                                  medicineCategoryId:
                                                      pharmacyCategoriesInfo
                                                          ?.id,
                                                  price: int.parse(
                                                    productPriceTextController
                                                        .text
                                                        .trim(),
                                                  ),
                                                  status:
                                                      selectStatus == true
                                                          ? 'active'
                                                          : 'inactive',
                                                  type: 'prescription',
                                                  expirationDate:
                                                      model.productExpiryDate,
                                                ),
                                              );
                                              getPharmMedicine();
                                              notifyListeners();
                                            } else {
                                              await model.addPharmMedicine(
                                                context: context,
                                                add: AddMedEntityModel(
                                                  name:
                                                      productNameTextController
                                                          .text
                                                          .trim(),
                                                  volume:
                                                      productVolumnTextController
                                                          .text
                                                          .trim(),
                                                  details:
                                                      productTextController.text
                                                          .trim(),
                                                  quantity: int.parse(
                                                    productQuantityTextController
                                                        .text
                                                        .trim(),
                                                  ),
                                                  medicineCategoryId:
                                                      pharmacyCategoriesInfo
                                                          ?.id,
                                                  price: int.parse(
                                                    productPriceTextController
                                                        .text
                                                        .trim(),
                                                  ),
                                                  status:
                                                      selectStatus == true
                                                          ? 'active'
                                                          : 'inactive',
                                                  type: 'prescription',
                                                  expirationDate:
                                                      model.productExpiryDate,
                                                ),
                                              );

                                              getPharmMedicine();
                                              notifyListeners();
                                            }
                                          }
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding:
                                              isTablet
                                                  ? EdgeInsets.all(10.w)
                                                  : EdgeInsets.all(20.w),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            color: AppColor.primary1,
                                          ),
                                          width: 170.w,
                                          child: TextView(
                                            text:
                                                id == null
                                                    ? 'Add Product'
                                                    : 'Update Product',
                                            textStyle: GoogleFonts.gabarito(
                                              color: AppColor.white,
                                              fontSize: 18.0.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                              SizedBox(height: 50.h),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  clearPharmProductController() {
    productNameTextController.clear();
    productVolumnTextController.clear();
    productTextController.clear();
    productQuantityTextController.clear();
    pharmacyCategoriesInfo = GetPharmacyCategories();
    productPriceTextController.clear();
    productCategoryTextController.clear();
    selectStatus = false;
    productExpiryDate = '';
    notifyListeners();
  }

  void deleteCategoryDialogBox(context, {String? prodId}) => showDialog(
    context: context,
    builder: (_) {
      return ViewModelBuilder<PharmViewModel>.reactive(
        viewModelBuilder: () => PharmViewModel(),
        onViewModelReady: (model) {},
        disposeViewModel: false,
        builder: (_, PharmViewModel model, __) {
          return AlertDialog(
            title: TextView(
              text: 'Delete Product Category',
              textStyle: GoogleFonts.dmSans(
                color: AppColor.fineRed,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            content: TextView(
              text:
                  'Do you want to delete this product category? Clicking OK will permanently delete it.',
              textStyle: GoogleFonts.dmSans(
                color: AppColor.black,
                fontSize: 15.0.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            actions:
                model.isLoadingDelCat
                    ? [SpinKitCircle(color: AppColor.primary1, size: 34.sp)]
                    : [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: TextView(
                          text: 'Cancel',
                          textStyle: GoogleFonts.dmSans(
                            color: AppColor.fineRed,
                            fontSize: 16.20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          await model.deletePharmCategories(
                            context,
                            id: prodId!,
                          );
                          await getPharmCategories();
                          model.notifyListeners();
                        },
                        child: TextView(
                          text: 'OK',
                          textStyle: GoogleFonts.dmSans(
                            color: AppColor.green,
                            fontSize: 16.20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
          );
        },
      );
    },
  );

  void deleteProductMedDialogBox(context, {String? prodId}) => showDialog(
    context: context,
    builder: (_) {
      return ViewModelBuilder<PharmViewModel>.reactive(
        viewModelBuilder: () => PharmViewModel(),
        onViewModelReady: (model) {},
        disposeViewModel: false,
        builder: (_, PharmViewModel model, __) {
          return AlertDialog(
            title: TextView(
              text: 'Delete Pharmaceutical Product',
              textStyle: GoogleFonts.dmSans(
                color: AppColor.fineRed,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            content: TextView(
              text:
                  'Do you want to delete this pharmaceutical product? Clicking OK will permanently delete it.',
              textStyle: GoogleFonts.dmSans(
                color: AppColor.black,
                fontSize: 15.0.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            actions:
                model.isLoadingDelMeds
                    ? [SpinKitCircle(color: AppColor.primary1, size: 34.sp)]
                    : [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: TextView(
                          text: 'Cancel',
                          textStyle: GoogleFonts.dmSans(
                            color: AppColor.fineRed,
                            fontSize: 16.20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          await model.deletePharmMed(context, id: prodId!);
                          getPharmMedicine();
                          model.notifyListeners();
                        },
                        child: TextView(
                          text: 'OK',
                          textStyle: GoogleFonts.dmSans(
                            color: AppColor.green,
                            fontSize: 16.20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
          );
        },
      );
    },
  );

  void modalBottomSheetAddCategory(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Enables full-screen dragging
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (builder) {
        final isTablet = MediaQuery.of(context).size.shortestSide >= 600;

        return ViewModelBuilder<PharmViewModel>.reactive(
          viewModelBuilder: () => PharmViewModel(),
          onViewModelReady: (model) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              model.getPharmCategories();
            });
          },
          builder: (_, PharmViewModel model, __) {
            return StatefulBuilder(
              builder: (_, StateSetter setState) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: DraggableScrollableSheet(
                    expand: false,
                    initialChildSize: 0.5, // 50% of screen height
                    minChildSize: 0.3, // Can be dragged to 30% of screen height
                    maxChildSize: 0.7, // Can be dragged to 90% of screen height
                    builder: (__, scrollController) {
                      return SingleChildScrollView(
                        padding: EdgeInsets.only(left: 12.w, right: 24.w),
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 6.0.h),
                            Center(
                              child: Container(
                                width: 30.w,
                                height: 3.5.h,
                                margin: EdgeInsets.only(top: 10.w),
                                decoration: BoxDecoration(
                                  color: AppColor.grey2.withOpacity(.4),
                                  borderRadius: BorderRadius.circular(22),
                                ),
                              ),
                            ),
                            SizedBox(height: 16.0.h),
                            TextView(
                              text:
                                  !model.onEditCate
                                      ? 'Add Categories'
                                      : 'Update Category',
                              textStyle: TextStyle(
                                color: AppColor.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            TextFormWidget(
                              label: 'Category Name',
                              labelStyle: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColor.primary1,
                              ),
                              border: 10,
                              isFilled: true,
                              fillColor: AppColor.white,
                              controller:
                                  model.addPharmCategoriesTextController,
                              validator: AppValidator.validateString(),
                            ),
                            SizedBox(height: 20.h),

                            if (model.getPharmacyCategoriesList != null &&
                                model
                                    .getPharmacyCategoriesList!
                                    .getPharmacyCategoriesList!
                                    .isNotEmpty)
                              ...model
                                  .getPharmacyCategoriesList!
                                  .getPharmacyCategoriesList!
                                  .map(
                                    (i) => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 250.w,
                                              child: TextView(
                                                text: i.name ?? '',
                                                maxLines: 1,
                                                textOverflow:
                                                    TextOverflow.ellipsis,
                                                textStyle: TextStyle(
                                                  color: AppColor.black,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    model.onEditCate = true;
                                                    onEditGetPharmacyCategories =
                                                        i;
                                                    model
                                                            .addPharmCategoriesTextController
                                                            .text =
                                                        onEditGetPharmacyCategories!
                                                            .name!;
                                                    model.notifyListeners();
                                                  },
                                                  child: SvgPicture.asset(
                                                    AppImage.edit,
                                                    width: 20.w,
                                                    height: 20.h,
                                                    color: AppColor.black,
                                                  ),
                                                ),
                                                SizedBox(width: 10.w),
                                                IconButton(
                                                  onPressed: () {
                                                    model
                                                        .deleteCategoryDialogBox(
                                                          context,
                                                          prodId:
                                                              i.id.toString(),
                                                        );
                                                    model.notifyListeners();
                                                  },
                                                  icon: Icon(
                                                    Icons
                                                        .remove_circle_outline_outlined,
                                                    color: AppColor.fineRed,
                                                    size: 22.sp,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          color: AppColor.greyIt.withOpacity(
                                            .2,
                                          ),
                                        ),
                                        SizedBox(height: 2.h),
                                      ],
                                    ),
                                  ),

                            SizedBox(height: 35.0.h),
                            !model.isLoading
                                ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () => Navigator.pop(context),
                                      child: Container(
                                        padding:
                                            isTablet
                                                ? EdgeInsets.all(12.0.w)
                                                : EdgeInsets.all(20.0.w),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          color: const Color.fromARGB(
                                            255,
                                            208,
                                            234,
                                            222,
                                          ),
                                        ),
                                        width: 140.w,
                                        alignment: Alignment.center,
                                        child: TextView(
                                          text: 'Cancel',
                                          textStyle: GoogleFonts.gabarito(
                                            color: AppColor.primary1,
                                            fontSize: 18.0.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        !model.onEditCate
                                            ? model.addPharmCategories(
                                              model
                                                  .addPharmCategoriesTextController
                                                  .text
                                                  .trim(),
                                            )
                                            : model.updatePharmCategories(
                                              name:
                                                  model
                                                      .addPharmCategoriesTextController
                                                      .text
                                                      .trim(),
                                              id:
                                                  onEditGetPharmacyCategories
                                                      ?.id
                                                      .toString(),
                                            );

                                        model.notifyListeners();
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding:
                                            isTablet
                                                ? EdgeInsets.all(10.w)
                                                : EdgeInsets.all(20.w),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          color: AppColor.primary1,
                                        ),
                                        child: TextView(
                                          text:
                                              !model.onEditCate
                                                  ? 'Add Category'
                                                  : 'Update Category',
                                          textStyle: GoogleFonts.gabarito(
                                            color: AppColor.white,
                                            fontSize: 18.0.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                                : SpinKitCircle(
                                  color: AppColor.primary1,
                                  size: 34.sp,
                                ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  String statusValue(status) {
    if (status == 'cancelled') {
      return 'Failed';
    }
    if (status == 'processed') {
      return 'In Process';
    }
    return 'Completed';
  }

  Color statusValueColor(status) {
    if (status == 'cancelled') {
      return AppColor.fineRed;
    }
    if (status == 'processed') {
      return AppColor.yellow;
    }
    return AppColor.primary1;
  }
}
