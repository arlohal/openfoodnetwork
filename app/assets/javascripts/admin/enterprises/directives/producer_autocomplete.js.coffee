angular.module("admin.enterprises").directive "ofnProducerAutocomplete", (Enterprises, AutocompleteSelect2) ->
  scope: true
  link: (scope,element,attrs) ->
    multiple = scope.$eval attrs.multipleSelection
    placeholder = attrs.placeholder
    initialSelection = scope.$eval attrs.ngModel
    suppliers = scope.suppliers

    setTimeout ->
      AutocompleteSelect2.autocomplete(
        multiple,
        placeholder,
        element,
        (-> Enterprises.findByID(initialSelection)),
        (-> Enterprises.findByIDs(initialSelection)),
        ((term) -> Enterprises.findByTerm(suppliers, term))
      )
