import 'package:news_app/models/category_Model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = [];

  CategoryModel categoryModel = CategoryModel();
  categoryModel.categoryName = "Business";
  categoryModel.image = 'assets/categories/business.png';
  category.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.categoryName = "Technology";
  categoryModel.image = 'assets/categories/tech.png';
  category.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.categoryName = "Health";
  categoryModel.image = 'assets/categories/health.png';
  category.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.categoryName = "Science";
  categoryModel.image = 'assets/categories/science.png';
  category.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.categoryName = "Sports";
  categoryModel.image = 'assets/categories/sports.png';
  category.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.categoryName = "General";
  categoryModel.image = 'assets/categories/general.png';
  category.add(categoryModel);
  categoryModel = CategoryModel();

  return category;
}
