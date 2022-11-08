import 'package:duka_user/core/models/simulation/simul_models/notification_model.dart';
import 'package:duka_user/core/models/simulation/simul_models/product_model.dart';
import 'package:duka_user/core/models/simulation/simul_models/region_model.dart';
import 'package:duka_user/core/models/simulation/simul_models/vendor_model.dart';

List<Product> productList = [
  Product(
    id: 1,
    name: 'Spaghetti plantain & turkey',
    description:
        'Consist of shredded beef, turkey, plantain. orem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi',
    price: '1500',
    image1:
        'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80',
    image2:
        'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    image3:
        'https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=480&q=80',
    image4:
        'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    like: 1100,
    productCategoryId: 3,
    vendorId: 1,
  ),
  Product(
    id: 2,
    name: 'Firewood Jollof Rice Plantain & Turkey',
    description:
        'Consist of shredded beef, turkey, plantain. orem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi',
    price: '1500',
    image1:
        'https://images.unsplash.com/photo-1499028344343-cd173ffc68a9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    image2:
        'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    image3:
        'https://images.unsplash.com/photo-1493770348161-369560ae357d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    image4:
        'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    like: 100,
    productCategoryId: 2,
    vendorId: 1,
  ),
  Product(
    id: 1,
    name: 'Spaghetti plantain & turkey',
    description:
        'Consist of shredded beef, turkey, plantain. orem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi',
    price: '1500',
    image3:
        'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80',
    image1:
        'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    image4:
        'https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=480&q=80',
    image2:
        'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    like: 1100,
    productCategoryId: 2,
    vendorId: 2,
  ),
  Product(
    id: 2,
    name: 'Spaghetti plantain & turkey',
    description:
        'Consist of shredded beef, turkey, plantain. orem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi',
    price: '1500',
    image4:
        'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80',
    image1:
        'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    image2:
        'https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=480&q=80',
    image3:
        'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    like: 1100,
    productCategoryId: 3,
    vendorId: 2,
  ),
];

List<Vendor> vendorList = [
  Vendor.fromJson({
    "id": 1,
    "name": "Tomi Ventures",
    "email": "momohmayowa14@gmail.com",
    "email_verified_at": "2022-10-19 11:40:24",
    "admin_verified": 1,
    "phone": "08168252201",
    "company_proof":
        "https://res.cloudinary.com/dlkz0omqy/image/upload/v1666175948/f0cgbzshnspgj49mwuiq.png",
    "category_id": 1,
    "created_at": "2022-10-19T10:39:08.000000Z",
    "updated_at": "2022-10-19T10:39:08.000000Z",
    "public_image":
        "https://images.unsplash.com/photo-1460306855393-0410f61241c7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8Y2hpY2tlbiUyMHJlcHVibGljJTIwYnVyZ2VyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    "status": "inactive",
    "address": '15, Unilag rd, akoka, Lagos',
    "min_order": '350',
    "prepare_time": '30-50 mins',
    "account_number": '0787860837',
    "rating": 0,
    "region_id": 1,
    "latitude": null,
    "longitude": null
  }),
  Vendor.fromJson({
    "id": 2,
    "name": "King Glab Cuisine",
    "email": "glabCuisine@gmail.com",
    "email_verified_at": "2022-10-19 11:40:24",
    "admin_verified": 1,
    "phone": "08168253301",
    "company_proof":
        "https://res.cloudinary.com/dlkz0omqy/image/upload/v1666175948/f0cgbzshnspgj49mwuiq.png",
    "category_id": 2,
    "created_at": "2022-10-19T10:39:08.000000Z",
    "updated_at": "2022-10-19T10:39:08.000000Z",
    "public_image":
        "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    "status": "inactive",
    "address": '15, Unilag rd, cele, Lagos',
    "min_order": '300',
    "prepare_time": '30-35 mins',
    "account_number": '0787862037',
    "rating": 0,
    "region_id": 1,
    "latitude": null,
    "longitude": null
  }),
  Vendor.fromJson({
    "id": 3,
    "name": "Chicken Republic",
    "email": "glabCuisine@gmail.com",
    "email_verified_at": "2022-10-19 11:40:24",
    "admin_verified": 1,
    "phone": "08168253301",
    "company_proof":
        "https://res.cloudinary.com/dlkz0omqy/image/upload/v1666175948/f0cgbzshnspgj49mwuiq.png",
    "category_id": 2,
    "created_at": "2022-10-19T10:39:08.000000Z",
    "updated_at": "2022-10-19T10:39:08.000000Z",
    "public_image":
        "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    "status": "inactive",
    "address": '15, Unilag rd, cele, Lagos',
    "min_order": '300',
    "prepare_time": '30-35 mins',
    "account_number": '0787862037',
    "rating": 0,
    "region_id": 2,
    "latitude": null,
    "longitude": null
  }),
  Vendor.fromJson({
    "id": 4,
    "name": "King Glab Cuisine",
    "email": "glabCuisine@gmail.com",
    "email_verified_at": "2022-10-19 11:40:24",
    "admin_verified": 1,
    "phone": "08168253301",
    "company_proof":
        "https://res.cloudinary.com/dlkz0omqy/image/upload/v1666175948/f0cgbzshnspgj49mwuiq.png",
    "category_id": 2,
    "created_at": "2022-10-19T10:39:08.000000Z",
    "updated_at": "2022-10-19T10:39:08.000000Z",
    "public_image":
        "https://images.unsplash.com/photo-1460306855393-0410f61241c7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8Y2hpY2tlbiUyMHJlcHVibGljJTIwYnVyZ2VyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    "status": "inactive",
    "address": '15, Unilag rd, cele, Lagos',
    "min_order": '300',
    "prepare_time": '30-35 mins',
    "account_number": '0787862037',
    "rating": 0,
    "region_id": 2,
    "latitude": null,
    "longitude": null
  }),
  Vendor.fromJson({
    "id": 5,
    "name": "Wong Cuisine",
    "email": "glabCuisine@gmail.com",
    "email_verified_at": "2022-10-19 11:40:24",
    "admin_verified": 1,
    "phone": "08168253301",
    "company_proof":
        "https://res.cloudinary.com/dlkz0omqy/image/upload/v1666175948/f0cgbzshnspgj49mwuiq.png",
    "category_id": 2,
    "created_at": "2022-10-19T10:39:08.000000Z",
    "updated_at": "2022-10-19T10:39:08.000000Z",
    "public_image":
        "https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=480&q=80",
    "status": "inactive",
    "address": '15, Unilag rd, cele, Lagos',
    "min_order": '300',
    "prepare_time": '30-35 mins',
    "account_number": '0787862037',
    "rating": 0,
    "region_id": 3,
    "latitude": null,
    "longitude": null
  }),
  Vendor.fromJson({
    "id": 6,
    "name": "Wong Da Cuisine",
    "email": "glabCuisine@gmail.com",
    "email_verified_at": "2022-10-19 11:40:24",
    "admin_verified": 1,
    "phone": "08168253301",
    "company_proof":
        "https://res.cloudinary.com/dlkz0omqy/image/upload/v1666175948/f0cgbzshnspgj49mwuiq.png",
    "category_id": 2,
    "created_at": "2022-10-19T10:39:08.000000Z",
    "updated_at": "2022-10-19T10:39:08.000000Z",
    "public_image":
        "https://images.unsplash.com/photo-1460306855393-0410f61241c7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8Y2hpY2tlbiUyMHJlcHVibGljJTIwYnVyZ2VyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    "status": "inactive",
    "address": '15, Unilag rd, cele, Lagos',
    "min_order": '300',
    "prepare_time": '30-35 mins',
    "account_number": '0787862037',
    "rating": 0,
    "region_id": 3,
    "latitude": null,
    "longitude": null
  }),
];

List<RegionModel> regions = [
  RegionModel(id: 1, region: 'Abigi'),
  RegionModel(id: 2, region: 'Ake'),
  RegionModel(id: 3, region: 'Akomoji'),
  RegionModel(id: 4, region: 'Attan'),
  RegionModel(id: 5, region: 'Ayetoro'),
  RegionModel(id: 6, region: 'Ijebu Igbo'),
  RegionModel(id: 7, region: 'Ijebu Ode'),
  RegionModel(id: 8, region: 'Ikpotia'),
  RegionModel(id: 9, region: 'Ifo'),
  RegionModel(id: 10, region: 'Ipokia'),
  RegionModel(id: 11, region: 'Ikenne'),
  RegionModel(id: 12, region: 'Sagamu'),
];

List<NotificationModel> notificationGroup = [
  NotificationModel(
    number: 2,
    date: DateTime.parse('2022-11-08'),
    data: [
      NotificationItem(
        notificationMessage:
            'Your referral reward has been credited to your wallet ',
        read: false,
        notificationDate: DateTime.parse('2022-11-08T12:00:00'),
      ),
      NotificationItem(
        notificationMessage: 'Your delivery has arrived',
        read: false,
        notificationDate: DateTime.parse('2022-11-08T11:40:00'),
      ),
      NotificationItem(
        notificationMessage:
            'Your wallet has been successfully funded. Order now',
        read: true,
        notificationDate: DateTime.parse('2022-11-08T11:20:00'),
      ),
    ],
  ),
  NotificationModel(
    number: 1,
    date: DateTime.parse('2022-11-07'),
    data: [
      NotificationItem(
        notificationMessage:
            'Your referral reward has been credited to your wallet ',
        read: true,
        notificationDate: DateTime.parse('2022-11-07T19:00:00'),
      ),
      NotificationItem(
        notificationMessage: 'Your delivery has arrived',
        read: false,
        notificationDate: DateTime.parse('2022-11-07T12:40:00'),
      ),
      NotificationItem(
        notificationMessage:
            'Your wallet has been successfully funded. Order now',
        read: true,
        notificationDate: DateTime.parse('2022-11-07T11:20:00'),
      ),
    ],
  ),
  NotificationModel(
    number: 1,
    date: DateTime.parse('2022-11-06'),
    data: [
      NotificationItem(
        notificationMessage:
            'Your referral reward has been credited to your wallet ',
        read: false,
        notificationDate: DateTime.parse('2022-11-06T20:00:00'),
      ),
      NotificationItem(
        notificationMessage: 'Your delivery has arrived',
        read: true,
        notificationDate: DateTime.parse('2022-11-06T17:40:00'),
      ),
      NotificationItem(
        notificationMessage:
            'Your wallet has been successfully funded. Order now',
        read: true,
        notificationDate: DateTime.parse('2022-11-06T11:20:00'),
      ),
    ],
  ),
];
