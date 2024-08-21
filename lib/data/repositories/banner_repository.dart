import 'package:e_commerce_app/features/shop/models/banner_model.dart';
import 'package:e_commerce_app/utils/constants/consts.dart';

class BannerRepository extends GetxController{
  static BannerRepository get instance => Get.find();

  ///Variables
  final _db = FirebaseFirestore.instance;

  ///Get all order related to current user
  Future<List<BannerModel>> fetchBanners()async{
    try{
      final result = await _db.collection('Banners').where('Active',isEqualTo: true).get();
      return result.docs.map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot)).toList();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong. while Fetching Banners';
    }

  }
 /// Upload Banners to cloud Firebase

}