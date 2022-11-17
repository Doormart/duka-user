// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:duka_user/core/models/simulation/simul_models/vendor_model.dart'
    as _i21;
import 'package:duka_user/core/models/simulation/simul_models/vendor_product.dart'
    as _i22;
import 'package:duka_user/features/auth_features/auth_home_view.dart' as _i3;
import 'package:duka_user/features/auth_features/create_account_otp_view.dart'
    as _i5;
import 'package:duka_user/features/auth_features/create_account_view.dart'
    as _i4;
import 'package:duka_user/features/auth_features/login_otp_view.dart' as _i7;
import 'package:duka_user/features/auth_features/login_view.dart' as _i6;
import 'package:duka_user/features/dashboard_features/dashboard_view.dart'
    as _i9;
import 'package:duka_user/features/dashboard_features/landing_view.dart' as _i8;
import 'package:duka_user/features/home_features/product_details_view.dart'
    as _i11;
import 'package:duka_user/features/home_features/vendor_details_view.dart'
    as _i10;
import 'package:duka_user/features/more_features/faqs_view.dart' as _i17;
import 'package:duka_user/features/more_features/referral_view.dart' as _i19;
import 'package:duka_user/features/more_features/support_view.dart' as _i18;
import 'package:duka_user/features/more_features/wallet_view.dart' as _i16;
import 'package:duka_user/features/orders_features/order_placed_view.dart'
    as _i13;
import 'package:duka_user/features/orders_features/order_tracking_view.dart'
    as _i14;
import 'package:duka_user/features/profile_features/delete_account_view.dart'
    as _i15;
import 'package:duka_user/features/profile_features/profile_view.dart' as _i12;
import 'package:duka_user/features/splash_screen_features/splash_screen_view.dart'
    as _i2;
import 'package:flutter/material.dart' as _i20;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i23;

class Routes {
  static const splashScreenView = '/';

  static const authHomeView = '/auth-home-view';

  static const createAccountView = '/create-account-view';

  static const createAccountOtpView = '/create-account-otp-view';

  static const loginView = '/login-view';

  static const loginOtpView = '/login-otp-view';

  static const landingView = '/landing-view';

  static const dashboardView = '/dashboard-view';

  static const vendorDetailsView = '/vendor-details-view';

  static const productDetailView = '/product-detail-view';

  static const profileView = '/profile-view';

  static const orderPlacedView = '/order-placed-view';

  static const orderTrackingView = '/order-tracking-view';

  static const deleteAccountView = '/delete-account-view';

  static const walletView = '/wallet-view';

  static const faqsView = '/faqs-view';

  static const supportView = '/support-view';

  static const referralView = '/referral-view';

  static const all = <String>{
    splashScreenView,
    authHomeView,
    createAccountView,
    createAccountOtpView,
    loginView,
    loginOtpView,
    landingView,
    dashboardView,
    vendorDetailsView,
    productDetailView,
    profileView,
    orderPlacedView,
    orderTrackingView,
    deleteAccountView,
    walletView,
    faqsView,
    supportView,
    referralView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splashScreenView,
      page: _i2.SplashScreenView,
    ),
    _i1.RouteDef(
      Routes.authHomeView,
      page: _i3.AuthHomeView,
    ),
    _i1.RouteDef(
      Routes.createAccountView,
      page: _i4.CreateAccountView,
    ),
    _i1.RouteDef(
      Routes.createAccountOtpView,
      page: _i5.CreateAccountOtpView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i6.LoginView,
    ),
    _i1.RouteDef(
      Routes.loginOtpView,
      page: _i7.LoginOtpView,
    ),
    _i1.RouteDef(
      Routes.landingView,
      page: _i8.LandingView,
    ),
    _i1.RouteDef(
      Routes.dashboardView,
      page: _i9.DashboardView,
    ),
    _i1.RouteDef(
      Routes.vendorDetailsView,
      page: _i10.VendorDetailsView,
    ),
    _i1.RouteDef(
      Routes.productDetailView,
      page: _i11.ProductDetailView,
    ),
    _i1.RouteDef(
      Routes.profileView,
      page: _i12.ProfileView,
    ),
    _i1.RouteDef(
      Routes.orderPlacedView,
      page: _i13.OrderPlacedView,
    ),
    _i1.RouteDef(
      Routes.orderTrackingView,
      page: _i14.OrderTrackingView,
    ),
    _i1.RouteDef(
      Routes.deleteAccountView,
      page: _i15.DeleteAccountView,
    ),
    _i1.RouteDef(
      Routes.walletView,
      page: _i16.WalletView,
    ),
    _i1.RouteDef(
      Routes.faqsView,
      page: _i17.FaqsView,
    ),
    _i1.RouteDef(
      Routes.supportView,
      page: _i18.SupportView,
    ),
    _i1.RouteDef(
      Routes.referralView,
      page: _i19.ReferralView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashScreenView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i2.SplashScreenView(),
        settings: data,
      );
    },
    _i3.AuthHomeView: (data) {
      final args = data.getArgs<AuthHomeViewArguments>(
        orElse: () => const AuthHomeViewArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i3.AuthHomeView(key: args.key),
        settings: data,
      );
    },
    _i4.CreateAccountView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i4.CreateAccountView(),
        settings: data,
      );
    },
    _i5.CreateAccountOtpView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i5.CreateAccountOtpView(),
        settings: data,
      );
    },
    _i6.LoginView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i6.LoginView(),
        settings: data,
      );
    },
    _i7.LoginOtpView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i7.LoginOtpView(),
        settings: data,
      );
    },
    _i8.LandingView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i8.LandingView(),
        settings: data,
      );
    },
    _i9.DashboardView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i9.DashboardView(),
        settings: data,
      );
    },
    _i10.VendorDetailsView: (data) {
      final args = data.getArgs<VendorDetailsViewArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i10.VendorDetailsView(key: args.key, vendor: args.vendor),
        settings: data,
      );
    },
    _i11.ProductDetailView: (data) {
      final args = data.getArgs<ProductDetailViewArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i11.ProductDetailView(
            key: args.key, vendorProduct: args.vendorProduct),
        settings: data,
      );
    },
    _i12.ProfileView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i12.ProfileView(),
        settings: data,
      );
    },
    _i13.OrderPlacedView: (data) {
      final args = data.getArgs<OrderPlacedViewArguments>(
        orElse: () => const OrderPlacedViewArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i13.OrderPlacedView(key: args.key),
        settings: data,
      );
    },
    _i14.OrderTrackingView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i14.OrderTrackingView(),
        settings: data,
      );
    },
    _i15.DeleteAccountView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i15.DeleteAccountView(),
        settings: data,
      );
    },
    _i16.WalletView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i16.WalletView(),
        settings: data,
      );
    },
    _i17.FaqsView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i17.FaqsView(),
        settings: data,
      );
    },
    _i18.SupportView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i18.SupportView(),
        settings: data,
      );
    },
    _i19.ReferralView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i19.ReferralView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class AuthHomeViewArguments {
  const AuthHomeViewArguments({this.key});

  final _i20.Key? key;
}

class VendorDetailsViewArguments {
  const VendorDetailsViewArguments({
    this.key,
    required this.vendor,
  });

  final _i20.Key? key;

  final _i21.Vendor vendor;
}

class ProductDetailViewArguments {
  const ProductDetailViewArguments({
    this.key,
    required this.vendorProduct,
  });

  final _i20.Key? key;

  final _i22.VendorProduct vendorProduct;
}

class OrderPlacedViewArguments {
  const OrderPlacedViewArguments({this.key});

  final _i20.Key? key;
}

extension NavigatorStateExtension on _i23.NavigationService {
  Future<dynamic> navigateToSplashScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAuthHomeView({
    _i20.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.authHomeView,
        arguments: AuthHomeViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreateAccountView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.createAccountView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreateAccountOtpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.createAccountOtpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginOtpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginOtpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLandingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.landingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.dashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVendorDetailsView({
    _i20.Key? key,
    required _i21.Vendor vendor,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.vendorDetailsView,
        arguments: VendorDetailsViewArguments(key: key, vendor: vendor),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProductDetailView({
    _i20.Key? key,
    required _i22.VendorProduct vendorProduct,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.productDetailView,
        arguments:
            ProductDetailViewArguments(key: key, vendorProduct: vendorProduct),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOrderPlacedView({
    _i20.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.orderPlacedView,
        arguments: OrderPlacedViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOrderTrackingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.orderTrackingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDeleteAccountView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.deleteAccountView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToWalletView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.walletView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToFaqsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.faqsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSupportView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.supportView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToReferralView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.referralView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
