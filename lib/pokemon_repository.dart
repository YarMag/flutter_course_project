class Pokemon {
  // some implementation will be there
}

class Category {}

class Generation {}

class PokemonRepository {

  List<Pokemon> findPokemonsByCategory(Category cat) {
    // ...
  }

  List<Pokemon> findPokemonsByGeneration(Generation gen) {
    // ...
  }

  Pokemon findPokemonByID(int id) {
    // ...
  }
}

class BadPokemonRepository {
  List<Pokemon> findPokemonsForCategoryInInternet(Category cat) {
    // ...
  }

  List<Pokemon> findPokemonsForCategoryInDatabase(Category cat) {
    // ...
  }

  List<Pokemon> findPokemonsForGenerationInInternet(Generation gen) {
    // ...
  }

  List<Pokemon> findPokemonsForGenerationInDatabase(Generation gen) {
    // ...
  }
}

class BadPokemonRepositoryWithEnum {
  PokemonRepositoryMode mode;

  List<Pokemon> findPokemonsByCategory(Category cat) {
    switch (mode) {
      case PokemonRepositoryMode.http:
        return _searchPokemonInInternet(Category cat);
      case PokemonRepositoryMode.localdb:
        return _searchPokemonInDatabase(Category cat);
      default:
        return null;
    }
  }

  List<Pokemon> findPokemonsByGeneration(Generation gen) {
    // ...
  }
}

enum PokemonRepositoryMode {
  http,
  localdb
}

abstract class IPokemonRepository {
  List<Pokemon> findPokemonsByCategory(Category cat);

  //List<Pokemon> findPokemonsByGeneration(Generation gen);

  //Pokemon findPokemonByID(int id);

// ...
}

class HttpPokemonRepository implements IPokemonRepository {
  // concrete http implementations
  @override
  List<Pokemon> findPokemonsByCategory(Category cat) {
    // TODO: implement findPokemonsByCategory
    return null;
  }
}

class DatabasePokemonRepository implements IPokemonRepository {
  // concrete database repository
}

class SecurePokemonRepository implements IPokemonRepository {
  final HttpPokemonRepository _repo;

  SecurePokemonRepository(this._repo);

  @override
  List<Pokemon> findPokemonsByCategory(Category cat) {
    if (_user.isAuthenticated) {
      return _repo.findPokemonsByCategory(cat);
    }
  }
}