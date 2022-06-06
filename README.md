- [x] Write the press release
- [ ] Update the website
- [ ] Contact the media

<p align="center" >
  <a href="https://luci.vn/">
    <img src="https://luci.vn/wp-content/uploads/2019/11/logo.png"  width="500">
  </a>
</p>

# Luci's Flutter Base

## 1. Project architecture (Clean Architecture Approach - TDD):

![img_2.png](/docs/images/img_2.png)

### 1.1. Presentation Layer:

~~~~
* Widgets
* BLoC
* BLoC only manages UI state based on business logic
~~~~

### 1.2. Domain Layer:

~~~~
* Entities (or models that UI needs)
* Usecases (user stories)
* Contract of what the Repository must do
* Remember, one class has one responsibility only.
~~~~

### 1.3. Data Layer:

~~~~
* data source
    * remotes (API)
    * locals (Database)
* model
    * request
    * response
* Repositories (the contract comes from the domain layer)
~~~~

## 2. Usage

### 2.1. Style & Theme - `lib/core/style`:

* Theme, colors, dimens and text style are defined in `lib/core/style` folder.

![img_3.png](/docs/images/img_3.png)

* Providing a ThemeData to the MaterialApp constructor to share a Theme across an entire app.

* Flutter’s Material widgets also use your Theme to set the background colors and font styles for AppBars,
  Buttons, Checkboxes, and more.

### 2.2. Development environment settings:

#### _Build App_

* All flavor environments are installed in the  `  "lib/enviroment/build_config.dart"`

Commands for Android

~~~~
## development: flutter build apk -t lib/main.dart --flavor development

## staging: flutter build apk -t lib/main.dart --flavor staging

## production: flutter build apk -t lib/main.dart --flavor production
~~~~

Commands for iOS

~~~~
## development: flutter build ios -t lib/main.dart --flavor development

## staging: flutter build ios -t lib/main.dart --flavor staging

## production: flutter build ios -t lib/main.dart --flavor production
~~~~

### 2.3. Resources:

* All resources (images, fonts, icons,...) must be placed in the  `  /assests` folder.

* Before using them, please declare the path in utility class and the suffix of the class to be type_provide (
  eg. `lib/resources/images_path.dart`)

### 2.4. Json parsing / serialization:

[json_serializable]: https://pub.dev/packages/json_serializable

* This project is implementing [json_serializable].
* Automatically generate code for converting to and from JSON by annotating Dart classes.
* Some commands when adding or modifying class:
    * Generating the code in '`*.g.dart`', which we have already included as part file.
        ~~~~
        ## flutter pub run build_runner build
        ~~~~
    * If you are making changes to the store and want to generate '`*.g.dart`' files automatically, you can
      use the following command:
        ~~~~
        ## flutter pub run build_runner watch
        ~~~~

    * Sometimes you may have an error running this command due to existing files, possibly generated from an
      earlier version of build_runner. In that case, you can add the following flag to delete the *.g.dart
      files before generating them.:
        ~~~~
        ## flutter pub run build_runner watch --delete-conflicting-outputs
        ~~~~

### 2.5. Localization

* Using <a href="https://pub.dev/packages/intl">this library</a> to handle multi-languages.

## 3. Workflow

![img.png](/docs/images/img.png)

In clean code architecture, there are three main layers

- Data
- Domain
- Presentation
- Core

### Step 1:

Creating a bunch of empty folders for the `presentation`, `domain`, `data layers` and `di` inside
`/lib/features`
folder. (Copy `/lib/features/__template`folder)

![img_1.png](/docs/images/img_1.png)

### Step 2: Domain Layer

"The actual coding process will happen from the inner, most stable layers of the architecture outwards."

=> Implementing the `Domain` - where contains only the core business logic (`use cases`) and business
objects (`entities`) layer.

- Entities
    - Starting with the `Entity` - business objects.
    - It extends `Equatable` to allow for easy value comparisons without all the boilerplate.

~~~~
class Post extends Equatable {
  final int id;
  final String title;
  final String body;

  const Post({required this.id, required this.title, required this.body});

  @override
  List<Object> get props => [id, title, body];
}
~~~~

- Use Cases & Repository
    - Implementing `Use Cases` and creating `a contract of the Repository`(which in the case of Dart is an
      abstract class).
    - UseCase will do is getting data from a
      `Repository` and they will pass these `entities` to the `Presentation layer`.
    - Adding parameters to the UseCase class.

Repository contract: `domain/repositories/post_repository`:

~~~~
abstract class PostRepository {
  Future<List<Post>> getPosts(int startIndex, int postLimit);
}
~~~~

Parameters:

~~~~
class GetPostParams extends Equatable {
  final int startIndex;
  final int postLimit;

  const GetPostParams({required this.startIndex, required this.postLimit});

  @override
  List<Object> get props => [startIndex, postLimit];
}
~~~~

Use Case: `get_posts.dart`:

~~~~
class GetPosts implements UseCase<List<Post>, GetPostParams> {
  final PostRepository postRepository;

  GetPosts(this.postRepository);

  @override
  Future<List<Post>> call(GetPostParams params) {
    return postRepository.getPosts(params.startIndex, params.postLimit);
  }
}
~~~~

### Step 3: Data Layer

Implementing the `Data` - consists of a `Repository` implementation and `data sources`.

![img_5.png](/docs/images/img_5.png)

- Model: `Response & Request Models`
    - Noticing that data sources return `Models`.
    - We create `Model` classes which extend `BaseModel` and `override toDomain() func` to transform data into
      Entity and add some specific functionality (toJson, fromJson,...).

Response Model `data/models/posts_model_response.dart`:

~~~~
@JsonSerializable(explicitToJson: true)
class PostModelResponse extends BaseModel<Post> {
  PostModelResponse({required this.id, required this.title, required this.body});

  final int id;
  final String title;
  final String body;

  @override
  Post toDomain() {
    return Post(
      title: title,
      body: body,
      id: id,
    );
  }

  factory PostModelResponse.fromJson(Map<String, dynamic> json) =>
      _$PostModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelResponseToJson(this);
}
~~~~

Request Model `data/models/posts_model_request.dart`:

~~~~
@JsonSerializable(explicitToJson: true)
class PostsModelRequest {
  final int startIndex;
  final String postLimit;

  PostsModelRequest({
    required this.startIndex,
    required this.postLimit,
  });

  factory PostsModelRequest.fromJson(Map<String, dynamic> json) =>
      _$PostsModelRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PostsModelRequestToJson(this);
}

~~~~

- Data Sources: `Remote, Local,...`
    - `Data sources` - for getting remote (API) data and the other for caching that data.
    - **Eg**:
        - Remote Data Source `data/datasources/local/post_local_data_sources.dart`
        - Local Data Source `data/datasources/local/post_local_data_sources.dart`.

- Repository
    - `Repository` implementation (it's defined by the following contract from the domain layer).
    - `Repository` is where you decide if you return remote (API) or cached data, when to cache it and so on.
    - **Eg**: `lib/features/_sample_feature/data/repositories/post_repository.dart`

### Step 4: Presentation logic holders (BLoC)

[flutter_bloc]: https://pub.dev/packages/flutter_bloc

[get_it]: https://pub.dev/packages/get_it

- We're using [flutter_bloc]

- `Bloc` is at the boundary between the `domain` and `presentation` layers, it will depend on the `use cases`.

- eg: `lib/features/_sample_feature/presentation/bloc`

![img_6.png](/docs/images/img_6.png)

![img_7.png](/docs/images/img_7.png)

### Step 5: DI - Dependency Injection

- We're using [get_it] to implement DI pattern.
- `feature/di/feature_module.dart` is where connect all of the individual pieces of the app architecture.

- eg: `lib/features/_sample_feature/di/post_module.dart`:

~~~~
class PostModule extends DIModule {
  @override
  provides() {
    // BLoC
    sl.registerFactory(() => PostBloc(getPosts: sl()));

    // Use case
    sl.registerLazySingleton(() => GetPosts(sl()));

    // Repository
    sl.registerLazySingleton<PostRepository>(() => PostRepositoryImpl(
          networkInfo: sl(),
          postLocalDataSource: sl(),
          postRemoteDatasource: sl(),
        ));

    // Datasource
    sl.registerLazySingleton<PostLocalDataSource>(
        () => PostLocalDataSourceImpl());
    sl.registerLazySingleton<PostRemoteDataSource>(
        () => PostRemoteDataSource(sl()));

    // Core
    sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl.instance);
  }
}
~~~~

- After create, we add it in `lib/core/di/injection/injection.dart` folder.

![img_4.png](/docs/images/img_4.png)

### Step 6: User Interface

- This part will be all about building the UI and splitting it into multiple readable and maintainable
  Widgets.
- The only communication pathway between `UI widgets` and the rest of the app is
  the `presentation logic holder` (`feature_bloc.dart`).
- Eg: `feature/presentation/components/posts_list.dart`

![img_8.png](/docs/images/img_8.png)