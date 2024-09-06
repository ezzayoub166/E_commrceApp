import 'package:e_commerce_app/features/shop/models/brand_model.dart';
import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:e_commerce_app/features/shop/models/product_attribute_model.dart';
import 'package:e_commerce_app/features/shop/models/product_variation_model.dart';

import '../../features/shop/models/banner_model.dart';
import '../../features/shop/models/product_model.dart';
import '../constants/image_strings.dart';

class TDummyData {
  ///Banners
  static final List<BannerModel> banners = [
    // BannerModel(imageUrl: TImages.banner1, targetScreen: TRouts, active: active)
  ];

  ///User
  ///Cart
  ///Order
  ///List of All Categories
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: '1', name: 'Sports', image: TImages.sportIcon, isFeatured: true),
    CategoryModel(
        id: '5',
        name: 'Furniture',
        image: TImages.furnitureIcon,
        isFeatured: true),
    CategoryModel(
        id: '2',
        name: 'Electronics',
        image: TImages.electronicsIcon,
        isFeatured: true),
    CategoryModel(
        id: '3', name: 'Cloth', image: TImages.clothIcon, isFeatured: true),
    CategoryModel(
        id: '4', name: 'Animals', image: TImages.animalIcon, isFeatured: true),
    CategoryModel(
        id: '6', name: 'Shoes', image: TImages.shoeIcon, isFeatured: true),
    CategoryModel(
        id: '7',
        name: 'Cosmetics',
        image: TImages.cosmeticsIcon,
        isFeatured: true),
    CategoryModel(
        id: '14',
        name: 'jewelery',
        image: TImages.jeweleryIcon,
        isFeatured: true),

    ///SubCategories
    CategoryModel(
        id: '8',
        name: 'Sport Shoes',
        image: TImages.sportIcon,
        parentId: '1',
        isFeatured: false),
    CategoryModel(
        id: '9',
        name: 'Track suits',
        image: TImages.sportIcon,
        parentId: '1',
        isFeatured: false),
    CategoryModel(
        id: '10',
        name: 'Sport Equipments',
        image: TImages.sportIcon,
        parentId: '1',
        isFeatured: false),

    ///Furniture
    CategoryModel(
        id: '11',
        name: 'Bedroom furniture',
        image: TImages.furnitureIcon,
        parentId: '5',
        isFeatured: false),
    CategoryModel(
        id: '12',
        name: 'Kitchen furniture',
        image: TImages.furnitureIcon,
        parentId: '5',
        isFeatured: false),
    CategoryModel(
        id: '13',
        name: 'Office furniture',
        image: TImages.furnitureIcon,
        parentId: '5',
        isFeatured: false),

    ///electronics
    CategoryModel(
        id: '14',
        name: 'Laptop',
        image: TImages.electronicsIcon,
        parentId: '2',
        isFeatured: false),
    CategoryModel(
        id: '15',
        name: 'Mobile',
        image: TImages.electronicsIcon,
        parentId: '2',
        isFeatured: false),

    CategoryModel(
        id: '16',
        name: 'Shirts',
        image: TImages.clothIcon,
        parentId: '3',
        isFeatured: false),
  ];

  static final List<ProductModel> products = [
    ProductModel(
        id: "001",
        title: "Green Nike Sport shoe",
        stock: 15,
        price: 132,
        thumbnail: TImages.productImage1,
        description: "Green Nike sport shoe,the best brand.",
        brandModel: BrandModel(
            id: "1",
            name: 'Nike',
            image: TImages.nikeLogo,
            productCont: 265,
            isFeatured: true),
        images: [
          TImages.productImage1,
          TImages.productImage23,
          TImages.productImage21,
          TImages.productImage9
        ],
        scalePrice: 30,
        sku: 'ABR4568',
        categoryID: "1",
        productType: 'ProductType.variable',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Green', 'Red', 'Black']),
          ProductAttributeModel(
              name: 'Size', values: ['EU 30', 'EU 32', 'EU 34'])
        ],
        productVariation: [
          ProductVariationModel(
            id: '1',
            stock: 32,
            price: 134,
            scalePrice: 122.6,
            image: TImages.productImage1,
            description:
                'This is a Product description for Green like sports shoe.',
            attributesValues: {'Color': 'Green', 'Size': 'EU 34'},
          ),
          ProductVariationModel(
            id: '2',
            stock: 15,
            price: 132,
            image: TImages.productImage23,
            description:
                'This is a Product description for Green like sports shoe.',
            attributesValues: {'Color': 'Black', 'Size': 'EU 32'},
          ),
          ProductVariationModel(
            id: '3',
            stock: 0,
            price: 232,
            image: TImages.productImage23,
            description:
                'This is a Product description for Green like sports shoe.',
            attributesValues: {'Color': 'Black', 'Size': 'EU 34'},
          ),
          ProductVariationModel(
            id: '4',
            stock: 222,
            price: 232,
            image: TImages.productImage1,
            description:
                'This is a Product description for Green like sports shoe.',
            attributesValues: {'Color': 'Green', 'Size': 'EU 32'},
          ),
          ProductVariationModel(
            id: '5',
            stock: 0,
            price: 334,
            image: TImages.productImage21,
            description:
                'This is a Product description for Green like sports shoe.',
            attributesValues: {'Color': 'Green', 'Size': 'EU 32'},
          ),
          ProductVariationModel(
            id: '6',
            stock: 111,
            price: 123,
            image: TImages.productImage21,
            description:
                'This is a Product description for Green like sports shoe.',
            attributesValues: {'Color': 'Red', 'Size': 'EU 32'},
          ),
        ]),
    ProductModel(
      id: "002",
      title: "Blue T.Shirt for all ages",
      stock: 15,
      price: 33,
      isFeatured: true,
      thumbnail: TImages.productImage69,
      description: "This is Product is amazing and the best of the brands.",
      brandModel: BrandModel(id: "6", name: 'ZARA', image: TImages.zaraLogo),
      images: [
        TImages.productImage68,
        TImages.productImage69,
        TImages.productImage21,
        TImages.productImage5
      ],
      scalePrice: 30,
      sku: 'ABR4568',
      categoryID: "16",
      productType: 'ProductType.single',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
        ProductAttributeModel(name: 'Size', values: ['EU32', 'EU34'])
      ],
    ),
    ProductModel(
      id: "003",
      title: "Leather brown jacket",
      stock: 15,
      price: 3000,
      isFeatured: false,
      thumbnail: TImages.productImage64,
      description:
          "This is product description for Leather brown jacket .there more things that can Added but i am just practicing and nothing else",
      brandModel: BrandModel(id: "6", name: 'ZARA', image: TImages.zaraLogo),
      images: [
        TImages.productImage68,
        TImages.productImage69,
        TImages.productImage21,
        TImages.productImage5
      ],
      scalePrice: 30,
      sku: 'ABR4568',
      categoryID: "16",
      productType: 'ProductType.single',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
        ProductAttributeModel(name: 'Size', values: ['EU32', 'EU34'])
      ],
    ),
    ProductModel(
      id: "004",
      title: "4 Color caller t.shirt dry fit",
      stock: 15,
      price: 3000,
      isFeatured: false,
      thumbnail: TImages.productImage60,
      description:
          "This is product description for 4 Color caller t.shirt dry fit .there more things that can Added but i am just practicing and nothing else",
      brandModel: BrandModel(id: "6", name: 'ZARA', image: TImages.zaraLogo),
      images: [
        TImages.productImage60,
        TImages.productImage61,
        TImages.productImage62,
        TImages.productImage63
      ],
      scalePrice: 30,
      sku: 'ABR4568',
      categoryID: "16",
      productType: 'ProductType.variable',
      productAttributes: [
        ProductAttributeModel(
            name: 'Color', values: ['Green', 'Red', 'Yellow', 'Blue']),
        ProductAttributeModel(name: 'Size', values: ['EU30', 'EU32', 'EU34'])
      ],
      productVariation: [
        ProductVariationModel(
          id: '1',
          stock: 43,
          price: 134,
          scalePrice: 122.6,
          image: TImages.productImage60,
          description:
              'This is product description for 4 Color caller t.shirt dry fit ',
          attributesValues: {'Color': 'Red', 'Size': 'EU34'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 15,
          price: 132,
          image: TImages.productImage60,
          attributesValues: {'Color': 'Red', 'Size': 'EU32'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 0,
          price: 232,
          image: TImages.productImage61,
          attributesValues: {'Color': 'Yellow', 'Size': 'EU34'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 222,
          price: 232,
          image: TImages.productImage61,
          attributesValues: {'Color': 'Yellow', 'Size': 'EU32'},
        ),
        ProductVariationModel(
          id: '5',
          stock: 0,
          price: 232,
          image: TImages.productImage62,
          attributesValues: {'Color': 'Green', 'Size': 'EU34'},
        ),
        ProductVariationModel(
          id: '6',
          stock: 11,
          price: 332,
          image: TImages.productImage62,
          attributesValues: {'Color': 'Green', 'Size': 'EU30'},
        ),
        ProductVariationModel(
          id: '7',
          stock: 0,
          price: 334,
          image: TImages.productImage63,
          attributesValues: {'Color': 'Blue', 'Size': 'EU30'},
        ),
        ProductVariationModel(
          id: '8',
          stock: 11,
          price: 332,
          image: TImages.productImage63,
          attributesValues: {'Color': 'Blue', 'Size': 'EU34'},
        ),
      ],
    ),
    ProductModel(
      id: "005",
      title: "TOMI DOG foof",
      stock: 15,
      price: 20,
      isFeatured: false,
      thumbnail: TImages.productImage18,
      description:
          "this is a product description for TOMI Dog food .There are more things that can be added but i am just practicing and noting else",
      brandModel: BrandModel(
          id: "7",
          name: 'Tomi',
          image: TImages.appleLogo,
      ),
      scalePrice: 30,
      sku: 'ABR4568',
      categoryID: "4",
      productType: 'ProductType.single',
      productAttributes: [
        ProductAttributeModel(
            name: 'Color', values: ['Green', 'Red', 'Blue']),
        ProductAttributeModel(name: 'Size', values: [ 'EU32', 'EU34'])
      ],
    ),
    // ProductModel(
    //   id: "006",
    //   title: "4 Color caller t.shirt dry fit",
    //   stock: 15,
    //   price: 3000,
    //   isFeatured: false,
    //   thumbnail: TImages.productImage60,
    //   description:
    //       "This is product description for 4 Color caller t.shirt dry fit .there more things that can Added but i am just practicing and nothing else",
    //   brandModel: BrandModel(id: "6", name: 'ZARA', image: TImages.zaraLogo),
    //   images: [
    //     TImages.productImage60,
    //     TImages.productImage61,
    //     TImages.productImage62,
    //     TImages.productImage63
    //   ],
    //   scalePrice: 30,
    //   sku: 'ABR4568',
    //   categoryID: "16",
    //   productType: 'ProductType.variable',
    //   productAttributes: [
    //     ProductAttributeModel(
    //         name: 'Color', values: ['Green', 'Red', 'Yellow', 'Blue']),
    //     ProductAttributeModel(name: 'Size', values: ['EU30', 'EU32', 'EU34'])
    //   ],
    //   productVariation: [
    //     ProductVariationModel(
    //       id: '1',
    //       stock: 43,
    //       price: 134,
    //       scalePrice: 122.6,
    //       image: TImages.productImage60,
    //       description:
    //           'This is product description for 4 Color caller t.shirt dry fit ',
    //       attributesValues: {'Color': 'Red', 'Size': 'EU34'},
    //     ),
    //     ProductVariationModel(
    //       id: '2',
    //       stock: 15,
    //       price: 132,
    //       image: TImages.productImage60,
    //       attributesValues: {'Color': 'Red', 'Size': 'EU32'},
    //     ),
    //     ProductVariationModel(
    //       id: '3',
    //       stock: 0,
    //       price: 232,
    //       image: TImages.productImage61,
    //       attributesValues: {'Color': 'Yellow', 'Size': 'EU34'},
    //     ),
    //     ProductVariationModel(
    //       id: '4',
    //       stock: 222,
    //       price: 232,
    //       image: TImages.productImage61,
    //       attributesValues: {'Color': 'Yellow', 'Size': 'EU32'},
    //     ),
    //     ProductVariationModel(
    //       id: '5',
    //       stock: 0,
    //       price: 232,
    //       image: TImages.productImage62,
    //       attributesValues: {'Color': 'Green', 'Size': 'EU34'},
    //     ),
    //     ProductVariationModel(
    //       id: '6',
    //       stock: 11,
    //       price: 332,
    //       image: TImages.productImage62,
    //       attributesValues: {'Color': 'Green', 'Size': 'EU30'},
    //     ),
    //     ProductVariationModel(
    //       id: '7',
    //       stock: 0,
    //       price: 334,
    //       image: TImages.productImage63,
    //       attributesValues: {'Color': 'Blue', 'Size': 'EU30'},
    //     ),
    //     ProductVariationModel(
    //       id: '8',
    //       stock: 11,
    //       price: 332,
    //       image: TImages.productImage63,
    //       attributesValues: {'Color': 'Blue', 'Size': 'EU34'},
    //     ),
    //   ],
    // ),
  ];
}
